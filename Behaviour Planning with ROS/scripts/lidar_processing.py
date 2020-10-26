#!/usr/bin/env python

from __future__ import print_function
import rospy
from sensor_msgs.msg import LaserScan
import numpy as np


def find_max(raw_data):
    
    lidar_data = np.frombuffer(raw_data, dtype=np.float32).reshape([-1, 3])
    print(raw_data)


if __name__ == '__main__':
  
  try:
    rospy.Subscriber("/scan",LaserScan,find_max())
  except Exception, e:
    print ("done", e)
