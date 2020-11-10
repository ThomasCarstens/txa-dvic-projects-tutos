import numpy as np
import random
import matplotlib.pyplot as plt

from mpl_toolkits.mplot3d import Axes3D
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

fig = plt.figure()
ax = Axes3D(fig)
ax.set_xlim3d(0, 3)
ax.set_ylim3d(0,3)
ax.set_zlim3d(0,3)
x = [0,0.5,0.5,0]
y = [0,0,0,0]
z = [0,0,0.5,0.5]

A=np.array([x,y,z])

S=np.matrix([[2,0,0],[0,1,0],[0,0,1]])

A=np.dot(S,A)

theta = 75* np.pi/180
Rz = np.array([[np.cos(theta), -np.sin(theta), 0.0], [np.sin(theta),  np.cos(theta), 0.0],[0.0,0.0, 1.0],])


A= Rz @ A

Ty= np.matrix([[0,0,0,0],[3,3,3,3],[0,0,0,0]])

A=A + Ty
print("A: "+ str(A))
B=A.tolist()

x=B[0]
y=B[1]
z=B[2]

print( str(x))
print(y)
print(z)

verts = [list(zip(x,y,z))]
ax.add_collection3d(Poly3DCollection(verts))

plt.show()
