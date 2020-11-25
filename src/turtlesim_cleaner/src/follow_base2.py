#!/usr/bin/env python

import numpy as np
import rospy
import tf
from geometry_msgs.msg import TransformStamped
from std_msgs.msg import String
#from tf2_msgs.msg import TFMessage
import tf2_msgs.msg

from pycrazyswarm import *
import uav_trajectory

class ArenaFlyer():

    def __init__(self):

        self.swarm = Crazyswarm()
        #self.timeHelper = swarm.timeHelper
        self.allcfs = swarm.allcfs

        # when a message of type Pose is received.
        #self.ttl1_subscriber = rospy.Subscriber('/turtle1/pose',
        #                                                Pose, self.update_pose1)

        self.cf2_subscriber = rospy.Subscriber('/tf', tf2_msgs.msg.TFMessage, self.cf2_callback)
        self.cf2_pose = Pose()

        self.success = False

        self._feedback = actionlib_tutorials.msg.FibonacciFeedback()
        self._result = actionlib_tutorials.msg.FibonacciResult()
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, actionlib_tutorials.msg.FibonacciAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()

    # def update_pose1(self, data):
    #     """Callback function which is called when a new message of type Pose is
    #     received by the subscriber."""
    #     #print("UPDATE TT1")
    #     self.turtle1_pose = data
    #     self.turtle1_pose.x = round(self.turtle1_pose.x, 4)
    #     self.turtle1_pose.y = round(self.turtle1_pose.y, 4)
	#     #print("turtle1:")

    def cf2_callback(self, cf2):

    	#cf2 is a : cf2=tf2_msgs.msg.TFMessage([t])
    	#with t : t=geometry_msgs.msg.TransformStamped()

    	#create cf to be a TransformStamped:
    	cf = cf2.transforms[0]

    	self.cf2_pose.x = cf.transform.translation.x
    	self.cf2_pose.y = cf.transform.translation.y
    	self.cf2_pose.z = cf.transform.translation.z
    	print("cf2_pose:", self.cf2_pose)


    def execute_cb(self, goal):
        # helper variables
        #r = rospy.Rate(10)
        rospy.wait_for_message('/tf', tf2_msgs.msg.TFMessage, timeout=None)

        # append the seeds for the fibonacci sequence
        self._feedback.sequence = []
        self._feedback.sequence.append(0)
        self._feedback.sequence.append(1)
        self.success == False

        # publish info to the console for the user
        #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))

        # check that preempt has not been requested by the client
        # if self._as.is_preempt_requested():
        #     rospy.loginfo('%s: Preempted' % self._action_name)
        #     self._as.set_preempted()
        #     success = False
        #     break

        # start executing the action
        # x = TurtleBot()

        for cf in self.allcfs.crazyflies:
            print(cf.id)
            #cf.takeoff(1.0, 2.5)


            #now we test if he has reached the desired point.
        self.takeoff_transition()
            # print("press button to continue")
            # self.swarm.input.waitUntilButtonPressed()
            #
            # cf.land(0.04, 2.5)

        if self.success == False:

            print ("Not yet...")

            try:

                self._feedback.sequence.append(currentPose)
                # publish the feedback
                self._as.publish_feedback(self._feedback)
                #rospy.loginfo('%s: Now with tolerance %i with current pose [%s]' % (self._action_name, goal.order, ','.join(map(str,self._feedback.sequence))))

            except rospy.ROSInterruptException:
                print("except clause opened")
                pass


        if self.success == True:
            print("Reached the perimeter!!")
            self._result.sequence = self._feedback.sequence
            rospy.loginfo('My feedback: %s' % self._feedback)
            rospy.loginfo('%s: Succeeded' % self._action_name)
            self._as.set_succeeded(self._result)

    def euclidean_distance(self, goal_pose):
        """Euclidean distance between current pose and the goal."""
        euclidean_distance= sqrt(pow((goal_pose.x - self.cf2_pose.x), 2) + pow((goal_pose.y - self.cf2_pose.y), 2) + pow((goal_pose.z - self.cf2_pose.z), 2))
    	#print("distance is", round(euclidean_distance, 4), "between", goal_pose.x, "and", self.turtle1_pose.x )
    	return euclidean_distance

    def takeoff_transition(self):
        distance_tolerance = 1
        while self.euclidean_distance(self.cf2_pose) >= distance_tolerance:
            self.success = False

        if self.euclidean_distance(self.turtle2_pose) < distance_tolerance:
            self.success = True
            print("success is", self.success)
            #return success


if __name__ == "__main__":
    rospy.init_node('detect_perimeter', anonymous=True) # this is a maybe

    #swarm = Crazyswarm()
    #timeHelper = swarm.timeHelper
    #allcfs = swarm.allcfs
    drone = ArenaFlyer()


    server = FibonacciAction(rospy.get_name())
    rospy.spin()
