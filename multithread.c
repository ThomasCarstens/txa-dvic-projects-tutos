#include "MyClass.h"

MyClass::MyClass(ros::NodeHandle &nh1, ros::NodeHandle &nh2, ...)
{
    // ROS specific : topics, node handler
    nhCall_ = nh1;
    nhSrv_ = nh2;

    // Subscriptions, Advertising
    first_sub = nhCall_.subscribe("cf1_pos", 1, &MyClass::callback1, this);
    first_srv = nhSrv_.advertiseService("servicename", &MyClass::servicecallback, this);
    second_sub = nhCall_.subscribe("cf1_vel", 1, &MyClass::callback2, this);
    third_sub = nhCall_.subscribe("cf1_acc", 1, &MyClass::callback3, this);

    first_pub = nhCall_.advertise<my_msgs::message>("topicname4", 1);
}

// Callback Handling
void MyClass::callback1(my_msgs::message msg)
{
    // Do something
}


bool MyClass::run()
{

    while(nhCall_.ok())  // We may check also for the other NodeHandle state
    {
        ros::spinOnce();
    }

    return true;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "mynode");
    ros::NodeHandle nh_call;
    ros::NodeHandle nh_srv;

    MyClass mysupernode(nh_call, nh_srv, ...);
    mysupernode.run();
    return EXIT_SUCCESS;
}

ros::NodeHandle nh;
nh.setCallbackQueue(&my_callback_queue);


//my_callback_queue.callAvailable(ros::WallDuration());
// alternatively, .callOne(ros::WallDuration()) to only call a single callback instead of all available

ros::AsyncSpinner spinner(0, &my_callback_queue);
while (ros::ok()){
  spinner.start();
}
spinner.stop();
