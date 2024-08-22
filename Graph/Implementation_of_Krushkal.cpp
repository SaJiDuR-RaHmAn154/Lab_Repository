#include <bits/stdc++.h>
// #include<ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
#pragma GCC optimize("Ofast,unroll-loops")
using namespace std;
using namespace __gnu_pbds;

// Primitive Data Type
typedef long long ll;
typedef long double ld;
typedef unsigned long long ull;

// STL
#define umap unordered_map
#define uset unordered_set
#define sz(v) (int)v.size()
#define vi vector<int>
#define vll vector<ll>
#define vvi vector<vi>
#define vvl vector<vl>
#define vs vector<string>
#define pii pair<int, int>
#define pll pair<ll, ll>
#define vpii vector<pii>
#define vpll vector<pll>
#define mi map<int, int>
#define mll map<ll, ll>
#define pb push_back
#define eb emplace_back
#define pob pop_back
#define pf pop_front
#define mp make_pair
#define ff first
#define ss second
#define nl '\n'
#define fo(i, a, b) for (int i = a; i < b; ++i)
#define re(i, a, b) for (int i = a; i >= b; --i)
#define itr(it, v) for (auto it = v.begin(); it != v.end(); it++)
#define fr(x, v) for (auto &x : v)
#define all(v) v.begin(), v.end()
#define rev(v) reverse(all(v))
#define srt(v) sort(all(v))
#define grtsrt(v) sort(all(v), greater<ll>())
#define tl(v) transform(all(v), v.begin(), ::tolower)
#define tu(v) transform(all(v), v.begin(), ::toupper)
#define lb(v, x) *lower_bound(all(v), x)
#define ub(v, x) *upper_bound(all(v), x)
#define mn(v) *min_element(all(v))
#define mx(v) *max_element(all(v))
#define mem(a, x) memset(a, x, sizeof(a))

// Bit Operations
#define set_bit(x, k) (x |= (1LL << k))
#define uset_bit(x, k) (x &= ~(1LL << k))
#define check_bit(x, k) (x & (1LL << k))
#define toggle_bit(x, k) (x ^ (1LL << k))
#define one(x) __builtin_popcountll(x)
#define zero(x) __builtin_clz(x)
inline ll binaryToDecimal(string n)
{
    string num = n;
    ll dec_value = 0;
    int base = 1;
    int len = num.length();
    for (int i = len - 1; i >= 0; i--)
    {
        if (num[i] == '1')
            dec_value += base;
        base = base * 2;
    }
    return dec_value;
}
inline string decToBinary(int n)
{
    string s = "";
    int i = 0;
    while (n > 0)
    {
        s = to_string(n % 2) + s;
        n = n / 2;
        i++;
    }
    return s;
}

// Input_Output
#define ys cout << "YES\n"
#define no cout << "NO\n"
#define deb1(x) cout << #x << "=" << x << endl
#define deb2(x, y) cout << #x << "=" << x << "," << #y << "=" << y << endl
#define fout(x) fixed << setprecision(x)

// Fast IO
#define fast ios_base::sync_with_stdio(false), cin.tie(0), cout.tie(0)
// Mathmatical Functions
inline ll GCD(ll a, ll b) { return b == 0 ? a : GCD(b, a % b); }
inline ll LCM(ll a, ll b) { return a * b / GCD(a, b); }
inline double logb(ll base, ll num) { return (double)log(num) / (double)log(base); }
inline bool isPowerOfTwo(ll n)
{
    if (n <= 0)
        return false;
    return (ceil(log2(n)) == floor(log2(n)));
}
inline bool isPerfectSquare(ll x)
{
    if (x >= 0)
    {
        ll sr = sqrt(x);
        return (sr * sr == x);
    }
    return false;
}

// Operator Overloads
template <typename T1, typename T2> // cin >> pair<T1, T2>
istream &operator>>(istream &istream, pair<T1, T2> &p)
{
    return (istream >> p.ff >> p.ss);
}
template <typename T> // cin >> vector<T>
istream &operator>>(istream &istream, vector<T> &v)
{
    for (auto &it : v)
        cin >> it;
    return istream;
}
template <typename T1, typename T2> // cout << pair<T1, T2>
ostream &operator<<(ostream &ostream, const pair<T1, T2> &p)
{
    return (ostream << p.ff << " " << p.ss);
}
template <typename T> // cout << vector<T>
ostream &operator<<(ostream &ostream, const vector<T> &c)
{
    for (auto &it : c)
        cout << it << " ";
    return ostream;
}
template <typename T1, typename T2> // cin>>vector<pair<T1,T2>>
istream &operator>>(istream &istream, vector<pair<T1, T2>> &v)
{
    for (int i = 0; i < sz(v); i++)
        istream >> v[i].ff >> v[i].ss;
    return istream;
}
template <typename T1, typename T2> // cout<<vector<pair<T1,T2>>
ostream &operator<<(ostream &ostream, const vector<pair<T1, T2>> &v)
{
    for (auto &it : v)
        ostream << it.ff << " " << it.ss << nl;
    return ostream;
}

// Debug
#ifdef Debug
#define debug(x)       \
    cerr << #x << " "; \
    cerr << x << " ";  \
    cerr << endl;
#else
#define debug(x) ;
#endif

void setIO()
{
#ifndef ONLINE_JUDGE
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
#endif
}

// Constants
#define pi acos(-1)
const double eps = 1e-6;
const int N = 1e5 + 10;
const int M = 1e9 + 7;
const ll INF = LONG_LONG_MAX;

// DSU Data Structure
// Path compression+Union by Rank

class DSU
{
    int *parent, *rank;

public:
    DSU(int n)
    {
        parent = new int[n]; // Array of integers
        rank = new int[n];

        // parent -1,rank =1
        fo(i, 0, n)
        {
            parent[i] = -1;
            rank[i] = 1;
        }
    }

    // Find Function

    int find(int i)
    {
        if (parent[i] == -1)
            return i;
        return parent[i] = find(parent[i]);
    }
    // Unite(union)

    void unite(int x, int y)
    {
        int s1 = find(x), s2 = find(y);
        if (s1 != s2)
        {
            // Union by rank
            if (rank[s1] < rank[s2])
            {
                parent[s1] = s2;
                rank[s2] += rank[s1];
            }
            else
            {
                parent[s2] = s1;
                rank[s1] += rank[s2];
            }
        }
    }
};

class Graph
{
    vvi edgelist;
    int V;

public:
    Graph(int V)
    {
        this->V = V;
    }
    void addEdge(int x, int y, int wt)
    {
        edgelist.pb({wt, x, y}); // Weight in the first place to sort based on weight
        edgelist.pb({wt, y, x});
    }

    int Krushkal_mst()
    {
        // Main logic easy
        // 1.Sort all the edges based upon weight

        sort(all(edgelist));
        int ans = 0;

        // Initialize DSU

        DSU s(V);

        fr(edge, edgelist)
        {
            int wt = edge[0], x = edge[1], y = edge[2];

            // Take that edge in mst if it doesn't form a cycle
            // if x and y both belongs to different set then they don't form a cycle and we can merge them
            // Initially we consider all the vertices are in different set

            if (s.find(x) != s.find(y))
            {
                s.unite(x, y);
                ans += wt;
            }
        }
        return ans;
    }
};
void solve()
{
    /*
    Graph g(4);
    g.addEdge(0,1,1);
    g.addEdge(1,3,3);
    g.addEdge(3,2,4);
    g.addEdge(2,0,2);
    g.addEdge(0,3,2);
    g.addEdge(1,2,2);
 */
    int n, m;
    cin >> n >> m;
    Graph g(n);
    fo(i, 0, m)
    {
        int x, y, wt;
        cin >> x >> y >> wt;
        g.addEdge(x - 1, y - 1, wt);
    }
    cout << g.Krushkal_mst() << nl;
}
int main()
{
    fast;
    // setIO();
    int t = 1;
    // cin>>t;
    while (t--)
    {
        solve();
    }
    return 0;
}