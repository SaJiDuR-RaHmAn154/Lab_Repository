import numpy as np 

array1 = np.array([2,3,5]) # List converted into numpy array
array2 = np.array([[2,3,5],[4,5,6]]) # 2D array

z = np.zeros((3,3)) # Generates a matrix of size 3x3
k =np.ones((3,3)) 
arr = np.arange(2,10,2)
arr1 = np.linspace(0,1,5) # Equidistant 5 values will be generated


print(array1)
print(array2)
print(z)
print(k)
print(arr)
print(arr1)
print(type(z))


import pandas as pd 

data = [2,4,5,7]

# ser = pd.Series(data)
ser = pd.Series(data,index=['A','B','C','D'])
print(ser)

data1 ={
    'Name' : ['ABC','XYZ'],
    'Age' : [26,45]
}

df = pd.Dataframe(data1)
print(df)
print(df.head(5)) # First 5 rows will be printed
print(df.tail(5)) # Last 5 rows will be printed
