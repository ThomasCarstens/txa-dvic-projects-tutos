#!/usr/bin/env python

import numpy as np
import rospy
import tf
from geometry_msgs.msg import TransformStamped, Point, PoseStamped
from turtlesim.msg import Pose
from std_msgs.msg import String
#from tf2_msgs.msg import TFMessage
import tf2_msgs.msg

#from pycrazyswarm import *
#import uav_trajectory
#import actionlib
#import actionlib_tutorials.msg

from math import pow, atan2, sqrt

class ArenaFlyer(object):

    def __init__(self, name):

        self.cf2_subscriber = rospy.Subscriber('/tf', tf2_msgs.msg.TFMessage, self.cf2_callback)
	self.cf2_publisher = rospy.Publisher('/cf2/pose', PoseStamped, self.cf2_callback)
        self.cf2_pose = PoseStamped()
	rospy.spin()

    def cf2_callback(self, cf2):

    	#cf2 is a : cf2=tf2_msgs.msg.TFMessage([t])
    	#with t : t=geometry_msgs.msg.TransformStamped()

    	#create cf to be a PoseStamped:
    	cf = cf2.transforms[0]

    	self.cf2_pose.pose.position.x = cf.transform.translation.x
    	self.cf2_pose.pose.position.y = cf.transform.translation.y
    	self.cf2_pose.pose.position.z = cf.transform.translation.z

	self.cf2_publisher.publish(self.cf2_pose)
    	print("cf2_pose:", self.cf2_pose)
	


if __name__ == "__main__":
    rospy.init_node('extract_cf2_pose') # this is a maybe

    #swarm = Crazyswarm()
    #timeHelper = swarm.timeHelper
    #allcfs = swarm.allcfs
    drone_server = ArenaFlyer('detect_perimeter')
    #server = FibonacciAction('detect_perimeter')
    
