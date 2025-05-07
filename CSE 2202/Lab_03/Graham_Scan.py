import random
import time
import matplotlib.pyplot as plt
from math import atan2

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

def next_to_top(hull):
    p = hull.pop()
    res = hull[-1]
    hull.append(p)
    return res

def distance(p1, p2):
    return (p1.x - p2.x) ** 2 + (p1.y - p2.y) ** 2

def direction(p, q, r):
    val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y)
    if val == 0:
        return 0
    return 1 if val > 0 else 2

def cmp(p1, p2):
    o = direction(p0, p1, p2)
    if o == 0:
        return -1 if distance(p0, p2) >= distance(p0, p1) else 1
    return -1 if o == 2 else 1

def graham_scan(points):
    global p0
    ymin = points[0].y
    min_idx = 0
    for i in range(1, len(points)):
        y = points[i].y
        if y < ymin or (ymin == y and points[i].x < points[min_idx].x):
            ymin = y
            min_idx = i

    points[0], points[min_idx] = points[min_idx], points[0]
    p0 = points[0]
    points[1:] = sorted(points[1:], key=lambda p: atan2(p.y - p0.y, p.x - p0.x))

    k = 1
    for i in range(1, len(points)):
        while i < len(points) - 1 and direction(p0, points[i], points[i + 1]) == 0:
            i += 1
        points[k] = points[i]
        k += 1

    if k < 3:
        return []

    hull = [points[0], points[1], points[2]]

    for i in range(3, k):
        while len(hull) > 1 and direction(next_to_top(hull), hull[-1], points[i]) != 2:
            hull.pop()
        hull.append(points[i])

    return hull[::-1]  # Reverse to maintain the order of points

def plot_points_and_hull(points, convex_hull):
    x = [point.x for point in points]
    y = [point.y for point in points]

    plt.scatter(x, y, c='r', label='Points')
    
    hull_x = [point.x for point in convex_hull]
    hull_y = [point.y for point in convex_hull]
    plt.plot(hull_x + [hull_x[0]], hull_y + [hull_y[0]], c='b', label='Convex Hull')

    plt.xlabel('X-axis')
    plt.ylabel('Y-axis')
    plt.title('Graham Scan Convex Hull Visualization')
    plt.legend()
    plt.show()

def main():
    n = int(input("Enter the number of points: "))
    points = [Point(random.randint(0, 200), random.randint(0, 200)) for _ in range(n)]

    print('Points:')
    print('x=', [point.x for point in points])
    print('y=', [point.y for point in points])

    start = time.perf_counter()
    convex_hull = graham_scan(points)
    end = time.perf_counter()

    if not convex_hull:
        print('Convex hull cannot be formed with less than 3 points.')
    else:
        print('Convex Hull Points:')
        print('x=', [point.x for point in convex_hull])
        print('y=', [point.y for point in convex_hull])

        print('Elapsed time:', end - start)

        plot_points_and_hull(points, convex_hull)

if __name__ == "__main__":
    main()
