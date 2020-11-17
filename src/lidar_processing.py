#!/usr/bin/env python

from __future__ import print_function
from __future__ import division
import ros
import rospy
import math
from sensor_msgs.msg import LaserScan
import numpy as np
from decimal import Decimal

def find_max(msg):
    data = msg.ranges
    full_circle = len(data)
    print (len(data))
    #lidar_data = np.frombuffer(msg.ranges, dtype=np.float32).reshape([-1, 3])
    #print(lidar_data[4])
    print("min and max angles", msg.angle_min, msg.angle_max)

    max_distance_array = np.where(msg.ranges == np.amax(msg.ranges))
    random_max = max_distance_array[0][0]
    #print(max_distance_array)
    #print(random_max)
    max_angle_radians=(2*math.pi*(random_max/full_circle))
    max_angle_degrees=(360*(random_max/full_circle))
    print (max_angle_degrees)

    rightside= msg.ranges[0]
    leftside= msg.ranges[719]
    if rightside < 3.0 and leftside < 3.0:#assume only corner...
       print("passing obstacle") #technically passed after not during
    #print (math.pi)


if __name__ == '__main__':
  rospy.init_node('lidar_test') 
  rospy.Subscriber("/scan",LaserScan,find_max)
  rospy.spin()
  #except Exception, e:
  #  print ("done", e)
