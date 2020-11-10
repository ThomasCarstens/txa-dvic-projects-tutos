#FROM

#1 ESPACE: IMPORT
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
plt.style.use('seaborn-whitegrid')

df = sns.load_dataset("iris")
df.head()
print(df.head())
sepal_length= df["sepal_length"]
sepal_width= df["sepal_width"]

#matplotlib.pyplot.bar(x, height, width=0.8, bottom=None, *, align='center', data=None, **kwargs)

#p1 = plt.bar(ind, menMeans, width, yerr=menStd)
#p2 = plt.bar(ind, womenMeans, width,
#             bottom=menMeans, yerr=womenStd)
rng = np.random.RandomState(0)
colors = rng.rand(100)

p1= plt.plot(sepal_width, sepal_length, '-p', color="red",
         markersize=3, linewidth=0,
         markerfacecolor='orange',
         markeredgecolor='orange',
         markeredgewidth=2)

p1= plt.plot(df["petal_width"], df["sepal_width"], '-p', color="red",
         markersize=3, linewidth=0,
         markerfacecolor='blue',
         markeredgecolor='blue',
         markeredgewidth=2)

p2= plt.plot(df["petal_length"], df["sepal_width"], '-p', color="red",
         markersize=3, linewidth=0,
         markerfacecolor='red',
         #markeredgecolor='blue',
         markeredgewidth=2)

p2= plt.plot(df["petal_length"], df["sepal_width"], '-p', color="red",
         markersize=3, linewidth=0,
         markerfacecolor='green',
         #markeredgecolor='blue',
         markeredgewidth=2)

plt.ylabel('Sepal length (mm)')
plt.xlabel('Sepal width (mm)')
plt.title('Relationship between sepal length and width')
plt.xticks(4, ('G1', 'G2', 'G3', 'G4', 'G5'))
#plt.yticks(np.arange(0, 81, 10))
#plt.legend((p1[0], p2[0]), ('Men', 'Women'))

plt.show()
