#! /usr/bin/env python

from __future__ import print_function
import rospy
from geometry_msgs.msg import Twist, Point
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
import os


class FibonacciAction(object):
    # create messages that are used to publish feedback/result


    def __init__(self, name):
        self.mutex = threading.Lock()
        # Publisher which will publish to the topic '/turtle1/cmd_vel'.
        self.velocity_publisher1 = rospy.Publisher('/turtle1/cmd_vel',
                                                  Twist, queue_size=10)

        self.velocity_publisher2 = rospy.Publisher('/turtle2/cmd_vel',
                                                  Twist, queue_size=10)


        self.turtle1_pose = Pose()
        self.turtle2_pose = Pose()
        #global success
        self.rate = rospy.Rate(1000)

        # FIRST POSE UPDATE
        #self.PoseListener()

        self._feedback = actionlib_tutorials.msg.FibonacciFeedback()
        self._result = actionlib_tutorials.msg.FibonacciResult()
        self.success = False
        self._action_name = 'togoal'
        self.id1 = 1
        self._as = actionlib.SimpleActionServer(self._action_name, actionlib_tutorials.msg.FibonacciAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()

        self._feedback1 = actionlib_tutorials.msg.FibonacciFeedback()
        self._result1 = actionlib_tutorials.msg.FibonacciResult()
        self.success1 = False
        self._action_name1 = 'togoal1'
        self.id2 = 1
        print("_as name is", self._action_name1)
        self._as1 = actionlib.SimpleActionServer(self._action_name1, actionlib_tutorials.msg.FibonacciAction, execute_cb=self.execute_cb1, auto_start = False)
        self._as1.start()



    def PoseListener(self):
        # A subscriber to the topic '/turtle1/pose'. self.update_pose is called
        # when a message of type Pose is received.

        # self.pose_subscriber1 = rospy.Subscriber('/turtle1/pose',
        #                                         Pose, self.update_pose1)
        # self.pose_subscriber2 = rospy.Subscriber('/turtle2/pose',
        #                                         Pose, self.update_pose2)

        turtle1_pose = rospy.wait_for_message("/turtle1/pose", Pose, timeout=None)
        self.update_pose1(turtle1_pose)
        turtle2_pose = rospy.wait_for_message("/turtle2/pose", Pose, timeout=None)
        self.update_pose2(turtle2_pose)

    def execute_cb(self, goal):
        # helper variables
        r = rospy.Rate(10)
        print("!!!!!!!!! togoal pid is", goal.order)
        self.togoal_pid=goal.order


        # append the seeds for the fibonacci sequence
        self._feedback.sequence = []
        self._feedback.sequence.append(0)
        self._feedback.sequence.append(1)
        self.success == False

        # publish info to the console for the user
        #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))
        #self.id = goal.order
        self.turtle_pose= Pose()
        # if self.id == 1:
        #     self.turtle_pose = self.turtle1_pose
        # if self.id == 2:
        #     self.turtle_pose = self.turtle2_pose

        #if os.getpid() == self.togoal_pid:
        self.turtle_pose = self.turtle1_pose
        #if os.getpid() == self.togoal1_pid:
        #    self.turtle_pose11 = self.turtle2_pose



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

            #print ("while reexecuted")
            try:
                print("try clause tested")
                vel_msg = self.move2goal(goal.destination, self.turtle_pose)
                currentPose = int(self.turtle_pose.x)

                distance_tolerance = 0.2

                if self.euclidean_distance(goal.destination, self.turtle1_pose) < distance_tolerance:
                    self.success = True
                    break

                self.velocity_publisher1.publish(vel_msg)
                #print("my pose is", int(turtle_pose.x))
                #print("turtle1:", currentPose)
                ####goalPose = [self.turtle2_pose.x]
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
            self.success = False
            self.rate.sleep()



    def execute_cb1(self, goal):
        # helper variables
        r = rospy.Rate(10)
        self.togoal1_pid=goal.order
        print("!!!!!!!!! togoal111 pid is", os.getpid())

        # append the seeds for the fibonacci sequence
        self._feedback1.sequence = []
        self._feedback1.sequence.append(0)
        self._feedback1.sequence.append(1)
        self.success1 == False

        # publish info to the console for the user
        #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))
        #self.id1 = goal.order

        self.turtle_pose11= Pose()
        # if self.id == 1:
        #     self.turtle_pose11 = self.turtle1_pose
        # if self.id == 2:
        #     self.turtle_pose11 = self.turtle2_pose

        #if os.getpid() == self.togoal_pid:
        #    self.turtle_pose = self.turtle1_pose
        #if os.getpid() == self.togoal1_pid:
        self.turtle_pose11 = self.turtle2_pose



        # start executing the action
        # x = TurtleBot()

        while self.success1 == False:
            # check that preempt has not been requested by the client
            if self._as1.is_preempt_requested():
                rospy.loginfo('%s: Preempted' % self._action_name)
                self._as1.set_preempted()
                print("now preempted but what about the goal.")
                #self.success == True #so to integrate this file.
                self.success1 = False
                break

            #print ("while reexecuted")
            try:
                print("try clause tested")
                vel_msg = self.move2goal(goal.destination, self.turtle2_pose)
                #currentPose = int(self.turtle_pose11.x)

                distance_tolerance = 0.2

                if self.euclidean_distance(goal.destination, self.turtle_pose11) < distance_tolerance:
                    self.success1 = True
                    break

                self.velocity_publisher2.publish(vel_msg)

                self._feedback1.sequence.append(currentPose)
                # publish the feedback
                self._as1.publish_feedback(self._feedback1)
                #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))

            except rospy.ROSInterruptException:
                print("except clause opened")
                pass


        if self.success1 == True:
            print("Close node")
            self._result1.sequence = self._feedback1.sequence
            rospy.loginfo('My feedback: %s' % self._feedback1)
            rospy.loginfo('%s: Succeeded' % self._action_name1)
            self._as1.set_succeeded(self._result1)
            #self._as.cancelGoal()
            self.success1 = False
            self.rate.sleep()



    def update_pose1(self, data):
        """Callback function which is called when a new message of type Pose is
        received by the subscriber."""

        #self.mutex.acquire()
        #print("UPDATE TT1")
        self.turtle1_pose = data
        self.turtle1_pose.x = round(self.turtle1_pose.x, 4)
        self.turtle1_pose.y = round(self.turtle1_pose.y, 4)

        #if os.getpid() == self.togoal_pid:
        self.turtle_pose = self.turtle1_pose
        #if os.getpid() == self.togoal1_pid:
        #self.turtle_pose11 = self.turtle2_pose

        self.rate.sleep()
        #self.mutex.release()
	#print("turtle1:")

    def update_pose2(self, data):
        """Callback function which is called when a new message of type Pose is
        received by the subscriber."""

        #self.mutex.acquire()
        #print("UPDATE TT2")
        self.turtle2_pose = data
        self.turtle2_pose.x = round(self.turtle2_pose.x, 4)
        self.turtle2_pose.y = round(self.turtle2_pose.y, 4)

        #if os.getpid() == self.togoal_pid:
            #self.turtle_pose = self.turtle1_pose
        #if os.getpid() == self.togoal1_pid:
        self.turtle_pose11 = self.turtle2_pose

        self.rate.sleep()
        #self.mutex.release()

    def euclidean_distance(self, goal_pose, my_pose):
        """Euclidean distance between current pose and the goal."""
        euclidean_distance= sqrt(pow((goal_pose.x - my_pose.x), 2) + pow((goal_pose.y - my_pose.y), 2))
        print("distance is", round(euclidean_distance, 4), "between", goal_pose, "and", my_pose )
        return euclidean_distance


    def linear_vel(self, goal_pose, my_pose, constant=0.1):
        """See video: https://www.youtube.com()/watch?v=Qh15Nol5htM."""
        return constant * self.euclidean_distance(goal_pose, my_pose)

    def steering_angle(self, goal_pose, my_pose):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        angle = atan2(goal_pose.y - my_pose.y, goal_pose.x - my_pose.x)
        #print("atan2 is", angle)
        return angle

    def angular_vel(self, goal_pose, my_pose, constant=3):
        """See video: https://www.youtube.com/watch?v=Qh15Nol5htM."""
        return constant * (self.steering_angle(goal_pose, my_pose) - my_pose.theta)

    def move2goal(self, destination, my_pose):
        """Moves the turtle to the goal."""
        goal_point = Point()
        goal_point = destination #already parsed goal

        #goal_pose = Pose()
        #goal_pose = self.turtle2_pose

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
        #while (self.turtle2_pose.x == 0.0):
        #    print ("sleepn")
        #    rospy.wait_for_message("/turtle2/pose", Pose, timeout=None)
            #self.rate.sleep()

        #if self.turtle2_pose.x != 0.0 and self.turtle2_pose.y != 0.0:

        self.PoseListener()
        #print("POSE IS", self.turtle_pose)
        if self.euclidean_distance(goal_point, my_pose) >= distance_tolerance:
            print("debug: approach tt1")
            #self.mutex.acquire()


            # Porportional controller.
            # https://en.wikipedia.org/wiki/Proportional_control

            # Linear velocity in the x-axis.
            vel_msg.linear.x = self.linear_vel(goal_point, my_pose)
            vel_msg.linear.y = 0
            vel_msg.linear.z = 0

            # Angular velocity in the z-axis.
            vel_msg.angular.x = 0
            vel_msg.angular.y = 0
            vel_msg.angular.z = self.angular_vel(goal_point, my_pose)

            #print("speed is", vel_msg.linear.x, "and", vel_msg.angular.z)

            #LOCK THREAD
            #self.mutex.acquire()
            # Publishing our vel_msg
            #TEMPORARY: Only for Publisher 1
            print("PID is", os.getpid())


            # if os.getpid() == self.togoal_pid:
            #     self.velocity_publisher1.publish(vel_msg)
            #     self.success = False
            # if os.getpid() == self.togoal1_pid:
            #     self.velocity_publisher2.publish(vel_msg)
            #     self.success1 = False


            # Publish at the desired rate.
            #self.rate.sleep()

            #self.mutex.release()

            #print("success is", self.success)
            if self._as.is_preempt_requested():
                rospy.loginfo('%s: Preempted' % self._action_name)
                self._as.set_preempted()
                print("now preempted but what about the goal.")
                #self.success == True #so to integrate this file.
                self.success = False
                self.success1 = False
                #break

            #self.mutex.release()

        if self.euclidean_distance(goal_point, my_pose) < distance_tolerance:
            print("debug: reached tt1")
            vel_msg.linear.x = 0
            vel_msg.angular.z = 0

            # if os.getpid() == self.togoal_pid:
            #     self.velocity_publisher1.publish(vel_msg)
            #     self.success = True
            # if os.getpid() == self.togoal1_pid:
            #     self.velocity_publisher2.publish(vel_msg)
            #     self.success1 = True

            #self.rate.sleep()

        return vel_msg


if __name__ == '__main__':

    rospy.init_node('togoal')
    server = FibonacciAction(rospy.get_name())
    rospy.spin()
