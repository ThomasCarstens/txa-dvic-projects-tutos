#!/usr/bin/env python

from __future__ import print_function

from pycrazyswarm import *

import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    main()


def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("chatter", String, callback)
    rospy.spin()

def main():
    swarm = Crazyswarm()
    timeHelper = swarm.timeHelper
    allcfs = swarm.allcfs

    for cf in allcfs.crazyflies:
        print(cf.id)
        cf.takeoff(1.0, 2.5)
        print("press button to continue")
        swarm.input.waitUntilButtonPressed()
        cf.land(0.04, 2.5)
        #cf.s


if __name__ == "__main__":
    listener()
