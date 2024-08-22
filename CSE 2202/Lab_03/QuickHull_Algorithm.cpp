#include <bits/stdc++.h>
using namespace std;

#define point pair<int, int>
#define PI 3.141592654
set<point> Convex_Hull;

int getSide(point p1, point p2, point p)
{
    int x = (p.second - p1.second) * (p2.first - p1.first) - (p2.second - p1.second) * (p.first - p1.first);
    if (x < 0)
        return -1;
    if (x > 0)
        return 1;
    return 0;
}

int getDistance(point p1, point p2, point p)
{
    return abs((p2.first - p1.first) * (p.second - p1.second) - (p2.second - p1.second) * (p.first - p1.first));
}

void QuickHull(vector<point> p, point p1, point p2, int side)
{
    int max_dist = 0, index = -1;

    for (int i = 0; i < p.size(); i++)
    {
        int temp_dist = getDistance(p1, p2, p[i]);
        if (getSide(p1, p2, p[i]) == side and temp_dist > max_dist)
        {
            index = i;
            max_dist = temp_dist;
        }
    }
    if (index == -1)
    {
        Convex_Hull.insert(p1);
        Convex_Hull.insert(p2);
        return;
    }
    QuickHull(p, p[index], p1, -getSide(p1, p2, p[index]));
    QuickHull(p, p[index], p2, -getSide(p2, p1, p[index]));
}
void Calculate_Hull(vector<point> p)
{
    if (p.size() < 3)
    {
        cout << "Convex Hull can't be formed\n";
        return;
    }

    int min_x = 0, max_x = 0;

    for (int i = 1; i < p.size(); i++)
    {
        if (p[i].first < p[min_x].first)
            min_x = i;
        if (p[i].first > p[max_x].first)
            max_x = i;
    }
    QuickHull(p, p[min_x], p[max_x], 1);
    QuickHull(p, p[min_x], p[max_x], -1);
}
int main()
{
    vector<point> p, ans;
    int n;
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        int x = rand() % 100, y = rand() % 100;
        p.push_back({x, y});
    }
    cout << "x=[";
    for (int i = 0; i < n; i++)
    {
        (i != n - 1) ? cout << p[i].first << "," : cout << p[i].first;
    }
    cout << "]\ny=[";
    for (int i = 0; i < n; i++)
    {
        (i != n - 1) ? cout << p[i].second << "," : cout << p[i].second;
    }
    cout << "]\n";

    Calculate_Hull(p);

    for (auto z : Convex_Hull)
        ans.push_back(z);

    int ymin = ans[0].second, min = 0;

    for (int i = 1; i < n; i++)
    {
        int y = ans[i].second;

        if ((y < ymin) || (ymin == y && ans[i].first < ans[min].first))
        {
            ymin = ans[i].second;
            min = i;
        }
    }
    swap(ans[min], ans[0]);

    vector<pair<double, pair<int, int>>> points;
    for (int i = 1; i < ans.size(); i++)
    {
        int x = ans[i].first, y = ans[i].second;
        double angle = (atan2(y, x) * 180 / PI);
        angle+=(angle<0)*360 ;
        points.push_back({angle, {x, y}});
    }
    sort(points.begin(), points.end());

    cout << "Points of Convex Hull are:\n";
    cout << "x=[";
    for (int i = 0; i < points.size(); i++)
    {
        cout << points[i].second.first << ",";
    }
    cout << points[0].second.first << "]\ny=[";
    for (int i = 0; i < points.size(); i++)
    {
        cout << points[i].second.second << ",";
    }
    cout << points[0].second.second << "]\n";
}
