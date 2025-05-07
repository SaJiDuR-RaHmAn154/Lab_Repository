import random
import time
import matplotlib.pyplot as plt

def Graph(points,s):
    x = [point[0] for point in points]
    y = [point[1] for point in points]
    if s == "scatter": plt.scatter(x,y,c='r')
    if s == "plot": plt.plot(x,y,c='b')

def getSide(p1,p2,p3):
    
    val =  (p3[1] - p2[1]) * (p2[0] - p1[0]) - (p2[1] - p1[1]) * (p3[0] - p2[0])
    
    if val>0 : # Anticlockwise
        return 1
    else:
        return -1 if val<0 else 0 # -1 -> Clockwise, 0 -> Co-linear

def getDistance(p1,p2,p3):
    return abs((p3[1] - p1[1]) * (p2[0] - p1[0]) - (p2[1] - p1[1]) * (p3[0] - p1[0]))

def QuickHull(points,p1,p2,side,hull):
    max_dist = 0
    max_point = []

    for point in points :
        temp_dist = getDistance(p1,point,p2)
        if getSide(p1,point,p2) == side and max_dist < temp_dist :
            max_dist = temp_dist
            max_point = point 

    if max_point :
        hull.append(p1)
        hull.append(max_point)
        hull.append(p2)

        QuickHull(points,p1,max_point,side,hull)
        QuickHull(points,max_point,p2,side,hull)

def Calculate_Hull():
    

    n=int(input())
    if n<3 :
        print(f'No convex hull can be formed')
        return

    points = [[random.randint(-150,150),random.randint(-150,150)] for _ in range (n)]

    min_x,max_x=0,0

    for i in range(n):
        if points[i][0] < points[min_x][0] : min_x = i
        if points[i][0] > points[max_x][0] : max_x = i

    hull1 = []
    hull2 = []
    start= time.perf_counter()

    QuickHull(points,points[min_x],points[max_x],1,hull1)
    QuickHull(points,points[min_x],points[max_x],-1,hull2)

    end = time.perf_counter()
    
    hull1.sort(reverse=True)
    hull2.sort()

    Convex_Hull = hull1 + hull2
    

    print('Time elapsed:',end-start,'seconds')

    print(f'Points of the convex hull are:')
    for point in Convex_Hull:
        print('('+str(point[0])+','+str(point[1])+')',end = ',')
    
    p=[points[min_x],points[max_x]]
    Graph(points,"scatter")
    Graph(p,"scatter")
    Graph(Convex_Hull,"plot")
    plt.show()

Calculate_Hull()