#!/usr/bin/env python

import random


from collections import deque
import statistics 
from statistics import mode 

def test_queue(max_size=10):
    d = deque([], max_size)
    for i in range(1, 2*max_size):
        r = random.randint(0, 100000)
        d.append(r)
        print ('i=%d, len=%d r=%d' % (i, len(d), r))

    while d:
        print (d.popleft())




test_queue()


import statistics 
from statistics import mode, multimode 
  
def most_common(List): 
    return(mode(List)) 
    
List = [2, 1, 2, 2, 1, 3] 
print(most_common(List)) 

