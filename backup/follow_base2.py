#!/usr/bin/env python

import numpy as np
import rospy
import tf
from geometry_msgs.msg import TransformStamped
#from tf2_msgs.msg import TFMessage
import tf2_msgs.msg
from pycrazyswarm import *
import uav_trajectory

class ArenaFlyer():

    def __init__(self):

        self.swarm = Crazyswarm()
        #self.timeHelper = swarm.timeHelper
        self.allcfs = swarm.allcfs

	
    def callback(self, cf2):

	#cf2 is a : cf2=tf2_msgs.msg.TFMessage([t])
	#with t : t=geometry_msgs.msg.TransformStamped()

	#create cf to be a TransformStamped:
	cf = cf2.transforms[0]
	print(cf)

	x = cf.transform.translation.x
	y = cf.transform.translation.y
	z = cf.transform.translation.z
	print(z)


	if (z < 0.15):
	     z = 0.15

	for cf in allcfs.crazyflies:
		pos = np.array([x, y, z+0.5])
		print(pos)
		cf.cmdPosition(pos, 0)
                print(cf.position())
	#timeHelper.sleep(1.5+2.0)


    #print("press button to continue...")
    #swarm.input.waitUntilButtonPressed()


    def base_listener(self):
    	rospy.Subscriber('/tf', tf2_msgs.msg.TFMessage, self.callback)
    	#timeHelper.sleep(1.5)


if __name__ == "__main__":
    rospy.init_node('follow_node', anonymous=True) # this is a maybe

    swarm = Crazyswarm()
    #timeHelper = swarm.timeHelper
    allcfs = swarm.allcfs

    Z = 1.0
    allcfs.takeoff(targetHeight=Z, duration=1.4+Z)
    #timeHelper.sleep(1.5+Z)

    drone = ArenaFlyer()
    drone.base_listener()

    while (1):
         rospy.spin()

    allcfs.land(targetHeight=0.06, duration=1.0+Z)
    #timeHelper.sleep(1.0)
