#! /usr/bin/env python

from __future__ import print_function
import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
from math import pow, atan2, sqrt


import threading
from math import sqrt, pow
import smach_ros
import smach
#from machine.action import MachineAction
#import rospy

import actionlib

import actionlib_tutorials.msg



class FibonacciAction(object):
    # create messages that are used to publish feedback/result


    def __init__(self, name):

        # Publisher which will publish to the topic '/turtle1/cmd_vel'.
        self.velocity_publisher = rospy.Publisher('/turtle1/cmd_vel',
                                                  Twist, queue_size=10)

        # A subscriber to the topic '/turtle1/pose'. self.update_pose is called
        # when a message of type Pose is received.
        self.pose_subscriber = rospy.Subscriber('/turtle1/pose',
                                                Pose, self.update_pose1)
        self.pose_subscriber = rospy.Subscriber('/turtle2/pose',
                                                Pose, self.update_pose2)
        self.turtle1_pose = Pose()
        self.turtle2_pose = Pose()
        #global success
        self.rate = rospy.Rate(1000)

        self._feedback = actionlib_tutorials.msg.FibonacciFeedback()
        self._result = actionlib_tutorials.msg.FibonacciResult()
        self.success = False
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, actionlib_tutorials.msg.FibonacciAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()

    def execute_cb(self, goal):
        # helper variables
        r = rospy.Rate(10)


        # append the seeds for the fibonacci sequence
        self._feedback.sequence = []
        self._feedback.sequence.append(0)
        self._feedback.sequence.append(1)
        self.success == False

        # publish info to the console for the user
        #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))




        # start executing the action
        # x = TurtleBot()

        while self.success == False:
            # check that preempt has not been requested by the client
            if self._as.is_preempt_requested():
                rospy.loginfo('%s: Preempted' % self._action_name)
                self._as.set_preempted()
                print("now preempted but what about the goal.")
                #self.success == True #so to integrate this file.
                success = False
                break

            print ("while reexecuted")
            try:
                print("try clause tested")
                self.move2goal()
                currentPose = int(self.turtle1_pose.x)
                print(int(self.turtle1_pose.x))
                #print("turtle1:", currentPose)
                goalPose = [self.turtle2_pose.x]
                #print("turtle2:", goalPose)
                self._feedback.sequence.append(currentPose)
                # publish the feedback
                self._as.publish_feedback(self._feedback)
                #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))

            except rospy.ROSInterruptException:
                print("except clause opened")
                pass


        if self.success == True:
            print("Close node")
            self._result.sequence = self._feedback.sequence
            rospy.loginfo('My feedback: %s' % self._feedback)
            rospy.loginfo('%s: Succeeded' % self._action_name)
            self._as.set_succeeded(self._result)

    def update_pose1(self, data):
        """Callback function which is called when a new message of type Pose is
        received by the subscriber."""
        #print("UPDATE TT1")
        self.turtle1_pose = data
        self.turtle1_pose.x = round(self.turtle1_pose.x, 4)
        self.turtle1_pose.y = round(self.turtle1_pose.y, 4)
	#print("turtle1:")

    def update_pose2(self, data):
        """Callback function which is called when a new message of type Pose is
        received by the subscriber."""
        #print("UPDATE TT2")
        self.turtle2_pose = data
        self.turtle2_pose.x = round(self.turtle2_pose.x, 4)
        self.turtle2_pose.y = round(self.turtle2_pose.y, 4)
	#print("turtle2:")

    def euclidean_distance(self, goal_pose):
        """Euclidean distance between current pose and the goal."""
        euclidean_distance= sqrt(pow((goal_pose.x - self.turtle1_pose.x), 2) + pow((goal_pose.y - self.turtle1_pose.y), 2))
	#print("distance is", round(euclidean_distance, 4), "between", goal_pose.x, "and", self.turtle1_pose.x )
	return euclidean_distance


    def linear_vel(self, goal_pose, constant=0.1):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return constant * self.euclidean_distance(goal_pose)

    def steering_angle(self, goal_pose):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return atan2(goal_pose.y - self.turtle1_pose.y, goal_pose.x - self.turtle1_pose.x)

    def angular_vel(self, goal_pose, constant=3):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return constant * (self.steering_angle(goal_pose) - self.turtle1_pose.theta)

    def move2goal(self):
        """Moves the turtle to the goal."""
        goal_pose = Pose()

        # Get the input from the user.
        #goal_pose.x = input("Set your x goal: ")
        #goal_pose.y = input("Set your y goal: ")


        # Please, insert a number slightly greater than 0 (e.g. 0.01).
        distance_tolerance = 0.2#input("Set your tolerance: ")

        # goal_pose.x = self.turtle2_pose.x
        # goal_pose.y = self.turtle2_pose.y
        #print ("goal pose is", goal_pose.x, goal_pose.y)
        #print ("turtle2:", self.turtle2_pose.x, self.turtle2_pose.y)

        vel_msg = Twist()

        #wait for initialisation at startup
        while (self.turtle2_pose.x == 0.0):
            print ("sleepn")
            rospy.wait_for_message("/turtle2/pose", Pose, timeout=None)
            #self.rate.sleep()

        if self.turtle2_pose.x != 0.0 and self.turtle2_pose.y != 0.0:


            while self.euclidean_distance(self.turtle2_pose) >= distance_tolerance:
                self.success = False
                print(self.turtle2_pose)
                # Porportional controller.
                # https://en.wikipedia.org/wiki/Proportional_control

                # Linear velocity in the x-axis.
                vel_msg.linear.x = self.linear_vel(self.turtle2_pose)
                vel_msg.linear.y = 0
                vel_msg.linear.z = 0

                # Angular velocity in the z-axis.
                vel_msg.angular.x = 0
                vel_msg.angular.y = 0
                vel_msg.angular.z = self.angular_vel(self.turtle2_pose)

                # Publishing our vel_msg
                self.velocity_publisher.publish(vel_msg)
                #print("success is", self.success)
                if self._as.is_preempt_requested():
                    rospy.loginfo('%s: Preempted' % self._action_name)
                    self._as.set_preempted()
                    print("now preempted but what about the goal.")
                    #self.success == True #so to integrate this file.
                    self.success = False
                    break
                # Publish at the desired rate.
                self.rate.sleep()

            #print ("goal pose is", goal_pose.x, goal_pose.y)

            # Stopping our robot after the movement is over.
        	#print ("turtle1:", self.turtle1_pose.x, self.turtle1_pose.y)
        	#print ("turtle2:", self.turtle2_pose.x, self.turtle2_pose.y)
            if self.euclidean_distance(self.turtle2_pose) < distance_tolerance:
                vel_msg.linear.x = 0
                vel_msg.angular.z = 0
                self.velocity_publisher.publish(vel_msg)

                self.success = True
                print("success is", self.success)
                #return success

if __name__ == '__main__':
    # try:
    #     x = TurtleBot()
    #     x.move2goal()
    # except rospy.ROSInterruptException:
    #     pass

    rospy.init_node('togoal')
    server = FibonacciAction(rospy.get_name())
    rospy.spin()
