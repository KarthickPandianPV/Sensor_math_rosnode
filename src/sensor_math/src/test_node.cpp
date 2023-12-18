#include <stdlib.h>
#include <math.h>
#include <ros/ros.h>
#include <geometry_msgs/Pose.h>
#include <sensor_math/CustomIMUMsg.h>
#include <sensor_math/CustomOrientationMsg.h>

ros::Publisher pub1;
ros::Publisher pub2;

sensor_math::CustomIMUMsg imu_msg;
geometry_msgs::Pose depth_msg;
int main(int argc, char **argv) 
{
    
    ros::init(argc, argv, "test_node");
    ros::NodeHandle nh;

    pub1 = nh.advertise<sensor_math::CustomIMUMsg>("imu_data", 1);
    pub2 = nh.advertise<geometry_msgs::Pose>("depth_data", 1);

    ros::Rate loop_rate(10); 
    while (ros::ok()) 
    {
        
        imu_msg.acceleration[0]=0;
        imu_msg.acceleration[1]=0;
        imu_msg.acceleration[2]=9.6;

        imu_msg.gyroscope[0]=10.0;
        imu_msg.gyroscope[1]=0.5;
        imu_msg.gyroscope[2]=5.0;

        imu_msg.magnetometer[0]=45.0;
        imu_msg.magnetometer[1]=50.0;
        imu_msg.magnetometer[2]=55.0;
        
        depth_msg.position.z= 2.0;
        pub1.publish(imu_msg);
        pub2.publish(depth_msg);
        // ROS_INFO("Published: %d", msg.data);
        // count++;
        loop_rate.sleep();
    }
    ros::spin();
    return 0;
}
