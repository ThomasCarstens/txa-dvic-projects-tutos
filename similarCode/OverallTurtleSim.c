
#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"
//#include "ros/callback_queue.h"

//to print current position
void poseCallback(const turtlesim::Pose& msg)
{
    ROS_INFO_STREAM("Current Position: " << msg.x << ", " << msg.y << ", Direction: " << msg.theta);
}

int main(int argc, char **argv){
    const double FORWARD_SPEED_MPS = 0.1;
    const double PI = 3.14159265358979323846;
    const double TURN_SPEED_RPS = PI/20;
    ros::init(argc, argv, "move_turtle");
        ros::NodeHandle node;
    ros::Publisher pub = node.advertise<geometry_msgs::Twist>("turtle1/cmd_vel",10);
    ros::Subscriber sub = node.subscribe("turtle1/pose",10,poseCallback);

     geometry_msgs::Twist msg;
    //ros::CallbackQueue my_queue;
    //my_queue.callOne();
    ros::spinOnce();

    ros::Time start_time = ros::Time::now();

    //Go straight 1m
     ros::Rate rate(10);
     while(ros::ok() && ros::Time::now() - start_time < ros::Duration(10)){
        msg.linear.x = FORWARD_SPEED_MPS;
        pub.publish(msg);
        rate.sleep();\
        ros::spinOnce();
    }

    msg.linear.x = 0;
    start_time = ros::Time::now();

    //Turn 45deg
    while(ros::ok() && ros::Time::now() - start_time < ros::Duration(5)){
        msg.angular.z = TURN_SPEED_RPS;
        pub.publish(msg);
        rate.sleep();
        ros::spinOnce();
    }
    msg.angular.z = 0;
    //my_queue.callOne();

}
