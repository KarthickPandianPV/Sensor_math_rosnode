#include "../lib/Fusion/Fusion.h"
#include "fusion_node.hpp"
#include <stdbool.h>
#include "ros/ros.h"
#include "geometry_msgs/Vector3.h"



#define SAMPLE_RATE (100)
FusionMatrix gyroscope_misalignment_g = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f};
FusionVector gyroscope_sensitivity_g = {1.0f, 1.0f, 1.0f};
FusionVector gyroscope_offset_g = {0.0f, 0.0f, 0.0f};
FusionMatrix accelerometer_misalignment_g = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f};
FusionVector accelerometer_sensitivity_g = {1.0f, 1.0f, 1.0f};
FusionVector accelerometer_offset_g = {0.0f, 0.0f, 0.0f};
FusionMatrix softIron_matrix_g = {1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f};
FusionVector hardIron_offset_g = {0.0f, 0.0f, 0.0f};
FusionVector gyroscope = {0.0f, 0.0f, 0.0f}; 
FusionVector accelerometer = {0.0f, 0.0f, 1.0f}; 
FusionVector magnetometer = {1.0f, 0.0f, 0.0f};
bool acc_data_available = false, gyro_data_available = false, mag_data_available = false;
bool start = true;

FusionEuler euler;

ros::Subscriber sub1;
ros::Subscriber sub2;
ros::Subscriber sub3;
ros::Publisher orientation_pub;

geometry_msgs::Vector3 linear_acceleration;
geometry_msgs::Vector3 angular_velocity;
geometry_msgs::Vector3 magnetic_field;
geometry_msgs::Vector3 orientation_msg;


int main(int argc,char** argv) {

    
    // Initialise algorithms
    FusionOffset offset;
    FusionAhrs ahrs;
    ros::init(argc, argv, "fusion_node");
    ros::NodeHandle n;
    initROS(n);
    FusionOffsetInitialise(&offset, SAMPLE_RATE);
    FusionAhrsInitialise(&ahrs);
    // Set AHRS algorithm settings
    const FusionAhrsSettings settings = {
            .convention = FusionConventionNwu,
            .gain = 0.5f,
            .gyroscopeRange = 2000.0f, /* replace this with actual gyroscope range in degrees/s */
            .accelerationRejection = 10.0f,
            .magneticRejection = 10.0f,
            .recoveryTriggerPeriod = 5 * SAMPLE_RATE, /* 5 seconds */
    };
    FusionAhrsSetSettings(&ahrs, &settings);

    double current_time =ros::Time::now().toSec();
    double prev_time = current_time;
    while (ros::ok()) {
        if ((acc_data_available && gyro_data_available) && mag_data_available)
        {
            // Apply calibration
            // gyroscope = FusionCalibrationInertial(gyroscope, gyroscope_misalignment_g, gyroscope_sensitivity_g, gyroscope_offset_g);
            // accelerometer = FusionCalibrationInertial(accelerometer, accelerometer_misalignment_g, accelerometer_sensitivity_g, accelerometer_offset_g);
            // magnetometer = FusionCalibrationMagnetic(magnetometer, softIron_matrix_g, hardIron_offset_g);

            // Update gyroscope offset correction algorithm
            gyroscope = FusionOffsetUpdate(&offset, gyroscope);

            // Calculate delta time (in seconds) to account for gyroscope sample clock error
            current_time = ros::Time::now().toSec();
            float deltaTime = current_time - prev_time;
            std::cout<<deltaTime<<'\n';
            prev_time = current_time;

            if (start)
            {
                start = !start;
                deltaTime = 0;
            }
            

            // Update gyroscope AHRS algorithm
            FusionAhrsUpdate(&ahrs, gyroscope, accelerometer, magnetometer, deltaTime);

            euler = FusionQuaternionToEuler(FusionAhrsGetQuaternion(&ahrs));
            publishOrientation();
            acc_data_available = false; gyro_data_available = false; mag_data_available = false;
            
        }
        ros::spinOnce();
    }

        

}

void initROS(ros::NodeHandle n){
    orientation_pub = n.advertise<geometry_msgs::Vector3>("euler_orientation", 1);
    sub1=n.subscribe("linear_acceleration", 1, accelerometerCallBack);
    sub2=n.subscribe("angular_velocity", 1, gyroscopeCallBack);
    sub3=n.subscribe("magnetic_field", 1, magnetometerCallBack);
  
}

void accelerometerCallBack(const geometry_msgs::Vector3& acceleration_msg){
    // if (acceleration_msg.data.size != 3)
    // {
    //     ROS_INFO("Invalid message size, acceleration msg \n");
    //    return;
    // }
    float a_x = acceleration_msg.x, a_y = acceleration_msg.y, a_z = acceleration_msg.z;
    accelerometer = {a_x, a_y, a_z};

    acc_data_available = true;


}

void gyroscopeCallBack(const geometry_msgs::Vector3& angular_velocity_msg){
    // if (angular_velocity_msg.data.size != 3)
    // {
    //     ROS_INFO("Invalid message size, angular_velocity_msg  \n");
    //    return;
    // }
    float w_x = angular_velocity_msg.x, w_y = angular_velocity_msg.y, w_z = angular_velocity_msg.z;
    gyroscope = {w_x, w_y, w_z};
   
    gyro_data_available = true;


}

void magnetometerCallBack(const geometry_msgs::Vector3& magnetic_field_msg){
    // if (magnetic_field_msg.data.size != 3)
    // {
    //     ROS_INFO("Invalid message size, magnetic_field_msg  \n");
    //    return;
    // }
    float m_x = magnetic_field_msg.x, m_y = magnetic_field_msg.y, m_z = magnetic_field_msg.z;
    magnetometer = {m_x, m_y, m_z};

    mag_data_available = true;


}

void publishOrientation(){
    orientation_msg.x = euler.angle.yaw;
    orientation_msg.y = euler.angle.pitch;
    orientation_msg.z = euler.angle.roll;
    orientation_pub.publish(orientation_msg);
}

