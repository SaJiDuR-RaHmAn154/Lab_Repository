#include <bits/stdc++.h>

#define ff first
#define ss second
#define point pair<int, int>
using namespace std;

struct Point
{
    int x, y;
};

Point p0;

Point nextToTop(stack<Point> &hull)
{
    Point p = hull.top();
    hull.pop();
    Point res = hull.top();
    hull.push(p);
    return res;
}

int Distance(Point p1, Point p2)
{
    return (p1.x - p2.x) * (p1.x - p2.x) +
           (p1.y - p2.y) * (p1.y - p2.y);
}

int Direction(Point p, Point q, Point r)
{
    int val = (q.y - p.y) * (r.x - q.x) -
              (q.x - p.x) * (r.y - q.y);

    if (val == 0)
        return 0;
    return (val > 0) ? 1 : 2;
}

int cmp(const void *vp1, const void *vp2)
{
    Point *p1 = (Point *)vp1, *p2 = (Point *)vp2;

    int o = Direction(p0, *p1, *p2);
    if (o == 0)
        return (Distance(p0, *p2) >= Distance(p0, *p1)) ? -1 : 1;

    return (o == 2) ? -1 : 1;
}

void Graham_Scan(Point points[], int n)
{
    int ymin = points[0].y, min = 0;
    for (int i = 1; i < n; i++)
    {
        int y = points[i].y;

        if ((y < ymin) || (ymin == y && points[i].x < points[min].x))
        {
            ymin = points[i].y;
            min = i;
        }
    }

    swap(points[0], points[min]);
    p0 = points[0];
    qsort(&points[1], n - 1, sizeof(Point), cmp);

    int k = 1;
    for (int i = 1; i < n; i++)
    {
        while (i < n - 1 && Direction(p0, points[i], points[i + 1]) == 0)
            i++;

        points[k] = points[i];
        k++;
    }

    if (k < 3)
        return;

    stack<Point> hull;
    hull.push(points[0]);
    hull.push(points[1]);
    hull.push(points[2]);

    for (int i = 3; i < k; i++)
    {
        while (hull.size() > 1 && Direction(nextToTop(hull), hull.top(), points[i]) != 2)
            hull.pop();
        hull.push(points[i]);
    }
    vector<Point> Convex_Hull;
    while (!hull.empty())
    {
        Convex_Hull.push_back(hull.top());
        hull.pop();
    }
    cout<<"Points of the convex hull are:";
    cout << "\nx=[";
    for (auto it : Convex_Hull)
        cout << it.x << ",";
    cout << Convex_Hull[0].x << "]\ny=[";
    for (auto it : Convex_Hull)
        cout << it.y << ",";
    cout << Convex_Hull[0].y << "]\n";
}

int main()
{
    int n;
    cin >> n;
    Point points[n];
    clock_t start = clock();
    for (int i = 0; i < n; i++)
    {
        int x = rand() % 200, y = rand() % 200;
        points[i] = {x, y};
    }
    cout << "x=[";
    for (auto it : points)
        cout << it.x << ",";
    cout << "]\ny=[";
    for (auto it : points)
        cout << it.y << ",";
    cout << "]\n";
    Graham_Scan(points, n);
    clock_t end = clock();
    cout << "Elasped time: " << (float)(end - start) / CLOCKS_PER_SEC << " seconds" << endl;
}