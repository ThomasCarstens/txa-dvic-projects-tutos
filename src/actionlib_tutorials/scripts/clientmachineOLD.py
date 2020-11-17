#! /usr/bin/env python
from __future__ import print_function
import rospy
from std_msgs.msg import String
import sys
# Brings in the SimpleActionClient
import actionlib
import threading

# Brings in the messages used by the fibonacci action, including the
# goal message and the result message.
import actionlib_tutorials.msg


def GateCallback(msg):
    if msg.data != "searching":
         result = fibonacci_client()
    else:
         pass

def fibonacci_client():
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('my_action_server_name', actionlib_tutorials.msg.MachineAction)

    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()

    # Creates a goal to send to the action server.
    goal = actionlib_tutorials.msg.MachineGoal(order=20)

    # Sends the goal to the action server.
    client.send_goal(goal)

    # Waits for the server to finish performing the action.
    client.wait_for_result()

    # Prints out the result of executing the action
    #result = fibonacci_client()
    result = client.get_result()
    print("Result: finished", ', '.join([str(n) for n in result.sequence]))

    return client.get_result()  # A MachineResult



def lidar_client():
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('my_action_server_name', actionlib_tutorials.msg.LidarAction)

    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()

    # Creates a goal to send to the action server.
    goal = actionlib_tutorials.msg.LidarGoal(margin=20)

    # Sends the goal to the action server.
    client.send_goal(goal)

    # Waits for the server to finish performing the action.
    client.wait_for_result()

    # Prints out the result of executing the action
    #result = fibonacci_client()
    result = client.get_result()
    print("Result: finished")

    return client.get_result()  # A LidarResult

if __name__ == '__main__':
    try:
        # Initializes a rospy node so that the SimpleActionClient can
        # publish and subscribe over ROS.
        rospy.init_node('fibonacci_client_py')
        image_sub = rospy.Subscriber("gate_state", String, GateCallback)
        message = rospy.wait_for_message("gate_state", String)
        t1 = threading.Thread(target=fibonacci_client)
        t2 = threading.Thread(target=lidar_client)
        t1.start()
        t2.start()
        #result = fibonacci_client()
        #otherwise = lidar_client()
        #print (result)
        #print (message.data)
        #rospy.spin()

        
    except rospy.ROSInterruptException:
        print("program interrupted before completion", file=sys.stderr)
