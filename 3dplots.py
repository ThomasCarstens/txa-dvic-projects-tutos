from mpl_toolkits import mplot3d

import numpy as np
import matplotlib.pyplot as plt

fig = plt.figure()
ax = plt.axes(projection="3d")

#SCATTER PLOT
# z_line = np.linspace(0, 15, 1000)
# x_line = np.cos(z_line)
# y_line = np.sin(z_line)
# ax.plot3D(x_line, y_line, z_line, 'gray')
#
# z_points = 15 * np.random.random(100)
# x_points = np.cos(z_points) + 0.1 * np.random.randn(100)
# y_points = np.sin(z_points) + 0.1 * np.random.randn(100)
# ax.scatter3D(x_points, y_points, z_points, c=z_points, cmap='hsv');

from mpl_toolkits.mplot3d import Axes3D
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
import matplotlib.pyplot as plt
#fig = plt.figure()
#ax = Axes3D(fig)
x = [0,0.2,0.2,0]
y = [0,0,0.2,0.2]
z = [0,0,0.2,0.2]


A=np.array([x,y,z])


a= 1
verts=None
vert2=None
while a <= 4:
    print (a)
    a+=0.05


    verts = [list(zip(x,y,z))]
    print("verts", verts)

    if vert2:
        print("vert2", vert2)
        #ax.remove_collection3d(Poly3DCollection(vert2))
    if a <=2:
    #SHEAR TRANSFORM.
        S=np.matrix([[a,0,0],[0,1,0],[0,0,1]])
        V=np.dot(S,A)
        list1 = V.tolist()

    if a >2 and a <3:
    #ROTATION TRANSFORM.
        theta = a* np.pi/180
        Rz = np.array([[np.cos(theta), -np.sin(theta), 0.0], [np.sin(theta),  np.cos(theta), 0.0],[0.0,0.0, 1.0],])
        A= Rz @ A
        list1=A.tolist()

    if a >=3 and a<3.5:
    #TRANSLATE TRANSFORM.
        Ty= np.matrix([[0,0,0,0],[a-3,a-3,a-3,a-3],[0,0,0,0]])
        A=A + Ty
        list1=A.tolist()

    print (list1[0][1])
    x = list1[0]
    y = list1[1]
    z = list1[2]
    vert2 = [list(zip(x,y,z))]
    print (vert2)
    ax.add_collection3d(Poly3DCollection(vert2))
    plt.draw()
    plt.pause(0.001)
