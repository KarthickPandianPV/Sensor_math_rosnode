#include <stdlib.h>
#include <math.h>
#include <ros/ros.h>
#include <geometry_msgs/Pose.h>
#include <sensor_math/CustomIMUMsg.h>
#include <sensor_math/CustomOrientationMsg.h>
#include "/home/karthick/Sensor_math_ros/src/sensor_math/lib/Fusion/Fusion.h"

//Macros
#define SAMPLE_RATE 100
#define g 9.80665
#define ACCELERO_METER_SENSITIVITY_2 0.00003051757812*2
#define ACCELERO_METER_SENSITIVITY_4 0.00006103515625*2
#define ACCELERO_METER_SENSITIVITY_8 0.0001220703125*2
#define ACCELERO_METER_SENSITIVITY_16 0.000244140625*2
#define GYROSCOPE_SENSITIVITY_250 0.003814697266*2
#define GYROSCOPE_SENSITIVITY_500 0.007629394531*2
#define GYROSCOPE_SENSITIVITY_1000 0.01525878906*2
#define GYROSCOPE_SENSITIVITY_2000 0.03051757812*2

// global Variables
float ax, ay, az, gx, gy, gz, mx, my, mz, roll, pitch, yaw, depth;
int no_of_samples=0;
int offsetDivideCalled=0;

// message declaration
sensor_math::CustomIMUMsg imu_msg;
sensor_math::CustomOrientationMsg orientation_msg;
geometry_msgs::Pose quaternion_depth_msg;

// Publisher subscriber declaration
ros::Subscriber sub1;
ros::Subscriber sub2;

ros::Publisher pub1;
ros::Publisher pub2;
ros::Publisher pub3;

FusionOffset offset;
FusionAhrs ahrs;

// Calliberation constants

const FusionMatrix gyroscopeMisalignment = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f};
const FusionVector gyroscopeSensitivity = {GYROSCOPE_SENSITIVITY_250, GYROSCOPE_SENSITIVITY_250, GYROSCOPE_SENSITIVITY_250};
FusionVector gyroscopeOffset = {0.0f, 0.0f, 0.0f};
const FusionMatrix accelerometerMisalignment = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f};
const FusionVector accelerometerSensitivity = {ACCELERO_METER_SENSITIVITY_2, ACCELERO_METER_SENSITIVITY_2, ACCELERO_METER_SENSITIVITY_2};
FusionVector accelerometerOffset = {0.0f, 0.0f, 0.0f};
const FusionMatrix softIronMatrix = {0.989, -0.026, -0.013, -0.026, 0.963, -0.009, -0.013, -0.009, 1.052};
const FusionVector hardIronOffset = {59.94, 89.26, 75.24};

// Function declaration
void initializeSensorMath();
void applyIMUCalibration();
void applyDepthSensorCalibration();
void updateOrientation();
void imuCb(const sensor_math::CustomIMUMsg &imu_msg);
void depthCb(const geometry_msgs::Pose &orientation_depth_msg);
void updatePublishData();
void offsetAdd();
void offsetDivide();

int main(int argc, char **argv)
{
    ros::init(argc, argv, "main");
    ros::NodeHandle nh;

    initializeSensorMath();

    sub1 = nh.subscribe("imu_data", 1, imuCb);
    sub2 = nh.subscribe("depth_data", 1, depthCb);

    pub1 = nh.advertise<sensor_math::CustomIMUMsg>("output_imu", 1);
    pub2 = nh.advertise<geometry_msgs::Pose>("quaternion_orientation_depth", 1);
    pub3 = nh.advertise<sensor_math::CustomOrientationMsg>("euler_orientation", 1);

    ros::spin();
    return 0;
}
// Call back function for sub1.It calibrates IMU, Updates orientation and Publishes calibrated IMU data and euler_orientation
void imuCb(const sensor_math::CustomIMUMsg& imu_msg)
{
    ax = imu_msg.acceleration[0];
    ay = imu_msg.acceleration[1];
    az = imu_msg.acceleration[2];

    gx = imu_msg.gyroscope[0];
    gy = imu_msg.gyroscope[1];
    gz = imu_msg.gyroscope[2];

    mx = imu_msg.magnetometer[0];
    my = imu_msg.magnetometer[1];
    mz = imu_msg.magnetometer[2];
    
    if(no_of_samples<100)
        offsetAdd();
    else 
    {
      if (!offsetDivideCalled) 
        {
           offsetDivide();
           offsetDivideCalled = 1;  
        }
    }

    applyIMUCalibration();
    updateOrientation();
    updatePublishData();
    pub1.publish(imu_msg);
    pub3.publish(orientation_msg);
}

 // It calibrates depth sensor and publishes depth sensor data along with orientation in quaternion
void depthCb(const geometry_msgs::Pose& orientation_depth_msg)
{
    depth = orientation_depth_msg.position.z;
    applyDepthSensorCalibration();
    quaternion_depth_msg.position.z= depth;
    pub2.publish(quaternion_depth_msg);
}

//Initializes the algorithm. To be called only once.
void initializeSensorMath()
{
    FusionOffsetInitialise(&offset, SAMPLE_RATE);
    FusionAhrsInitialise(&ahrs);

    const FusionAhrsSettings settings = {
        .convention = FusionConventionNwu,
        .gain = 0.5f,
        .gyroscopeRange = 2000.0f,
        .accelerationRejection = 10.0f,
        .magneticRejection = 10.0f,
        .recoveryTriggerPeriod = 5 * SAMPLE_RATE,
    };
    FusionAhrsSetSettings(&ahrs, &settings);
}

// Calibrates IMU and updates ahrs . Also updates orientation in quaterion form.
void applyIMUCalibration()
{
    const clock_t timestamp = clock();
    FusionVector gyroscope = {gx, gy, gz};
    FusionVector accelerometer = {ax, ay, az};
    FusionVector magnetometer = {mx, my, mz};

    gyroscope = FusionCalibrationInertial(gyroscope, gyroscopeMisalignment, gyroscopeSensitivity, gyroscopeOffset);
    accelerometer = FusionCalibrationInertial(accelerometer, accelerometerMisalignment, accelerometerSensitivity, accelerometerOffset);
    magnetometer = FusionCalibrationMagnetic(magnetometer, softIronMatrix, hardIronOffset);

    gyroscope = FusionOffsetUpdate(&offset, gyroscope);

    static clock_t previousTimestamp;
    const float deltaTime = (float)(timestamp - previousTimestamp) / (float)CLOCKS_PER_SEC;
    previousTimestamp = timestamp;

    FusionAhrsUpdate(&ahrs, gyroscope, accelerometer, magnetometer, deltaTime);

    gx = gyroscope.axis.x;
    gy = gyroscope.axis.y;
    gz = gyroscope.axis.z;

    mx = magnetometer.axis.x;
    my = magnetometer.axis.y;
    mz = magnetometer.axis.z;

    ax = accelerometer.axis.x;
    ay = accelerometer.axis.y;
    az = accelerometer.axis.z;
}
// function to calibrate depth sensor
void applyDepthSensorCalibration()
{
    // depth=Depth_Sensor.depth();
}

// converts quaternion to Euler and updates roll,pitch,yaw
void updateOrientation()
{
    const FusionEuler rotation = FusionQuaternionToEuler(FusionAhrsGetQuaternion(&ahrs));
    const FusionVector translation = FusionAhrsGetEarthAcceleration(&ahrs);

    roll = rotation.angle.roll;
    pitch = rotation.angle.pitch;
    yaw = rotation.angle.yaw;

    ax = translation.axis.x;
    ay = translation.axis.y;
    az = translation.axis.z;

}

// Update the messages to be published 
void updatePublishData()
{
    imu_msg.acceleration[0]=ax;
    imu_msg.acceleration[1]=ay;
    imu_msg.acceleration[2]=az;

    imu_msg.gyroscope[0]=gx;
    imu_msg.gyroscope[1]=gy;
    imu_msg.gyroscope[2]=gz;

    imu_msg.magnetometer[0]=mx;
    imu_msg.magnetometer[1]=my;
    imu_msg.magnetometer[2]=mz;
    
    quaternion_depth_msg.orientation.x = ahrs.quaternion.element.x;
    quaternion_depth_msg.orientation.y = ahrs.quaternion.element.y;
    quaternion_depth_msg.orientation.z = ahrs.quaternion.element.z;
    quaternion_depth_msg.orientation.w = ahrs.quaternion.element.w;

    orientation_msg.roll = roll;
    orientation_msg.pitch = pitch;
    orientation_msg.yaw = yaw;
    

}

// Adds the accelerometer and gyroscope readings to their offsetVectors
void offsetAdd()
{
    gyroscopeOffset.axis.x += gx;
    gyroscopeOffset.axis.y += gy;
    gyroscopeOffset.axis.z += gz;

    accelerometerOffset.axis.x += ax;
    accelerometerOffset.axis.y += ay;
    accelerometerOffset.axis.z += az;

    no_of_samples++;
}

// Divides the offset by no_of_samples
void offsetDivide()
{
    gyroscopeOffset.axis.x /= no_of_samples;
    gyroscopeOffset.axis.y /= no_of_samples;
    gyroscopeOffset.axis.z /= no_of_samples;

    accelerometerOffset.axis.x /= no_of_samples;
    accelerometerOffset.axis.y /= no_of_samples;
    accelerometerOffset.axis.z /= no_of_samples;
    accelerometerOffset.axis.z -=g;
}



