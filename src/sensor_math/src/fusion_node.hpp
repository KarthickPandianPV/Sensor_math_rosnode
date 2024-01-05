#ifndef FUSION_NODE_HPP
#define FUSION_NODE_HPP
#define ORIENTATION_TOPIC "orientation"
#define ACCELERATION_TOPIC "orientation"
#define GYROSCOPE_TOPIC "orientation"
#define MAGNETOMETER_TOPIC "orientation"
#include "ros/ros.h"
#include "geometry_msgs/Vector3.h"
void initROS(ros::NodeHandle n);
void loadCalibrationConstants();
void accelerometerCallBack(const geometry_msgs::Vector3& acceleration_msg);
void gyroscopeCallBack(const geometry_msgs::Vector3& angular_velocity_msg);
void magnetometerCallBack(const geometry_msgs::Vector3& magnetic_field_msg);
void publishOrientation();
#endif