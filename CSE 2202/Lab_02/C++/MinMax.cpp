#include <bits/stdc++.h>
#pragma GCC optimize("Ofast,unroll-loops")
using namespace std;

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
#define eb emplace_backqaw
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
inline bool isPerfectSquare(ll x)
{
    if (x >= 0)
    {
        ll sr = sqrt(x);
        return (sr * sr == x);
    }
    return false;
}
inline bool isPowerOfTwo(ll n)
{
    if (n <= 0)
        return false;
    return (ceil(log2(n)) == floor(log2(n)));
}
inline ll GCD(ll a, ll b)
{
    return b == 0 ? a : GCD(b, a % b);
}
inline ll LCM(ll a, ll b)
{
    return a * b / GCD(a, b);
}
inline double logb(ll base, ll num)
{
    return (double)log(num) / (double)log(base);
}

// Operator Overloads
template <typename T1, typename T2> // cin >> pair<T1, T2>
istream &operator>>(istream &istream, pair<T1, T2> &p)
{
    return (istream >> p.first >> p.second);
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
    return (ostream << p.first << " " << p.second);
}
template <typename T> // cout << vector<T>
ostream &operator<<(ostream &ostream, const vector<T> &c)
{
    for (auto &it : c)
        cout << it << " ";
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
const int N = 1e6 + 10;
const int M = 1e9 + 7;
const ll INF = LONG_LONG_MAX;

int bf_min, bf_max;
void BruteForce(vector<int> &v)
{
    bf_min = v[0];
    bf_max = v[0];

    for (int i = 0; i < v.size(); i++)
    {
        if (v[i] > bf_max)
            bf_max = v[i];
        if (v[i] < bf_min)
            bf_min = v[i];
    }
}
pair<int, int> recurMinMax(vector<int> &v, int low, int high)
{
    if (low == high - 1)
    {
        if (v[low] <= v[high])
            return {v[low], v[high]};
        else
            return {v[high], v[low]};
    }
    else if (low == high)
        return {v[low], v[high]};
    else
    {
        pair<int, int> x = recurMinMax(v, low, (low + high) / 2);
        pair<int, int> y = recurMinMax(v, ((low + high) / 2) + 1, high);
        return {min(x.first, y.first), max(x.second, y.second)};
    }
}
void solve()
{
    int n;
    cin >> n;
    vector<int> v;
    //File Writting
    ofstream outfile("min_max.txt");
    for (int i = 0; i < n; i++)
    {
        int p = rand() % (3 * n);
        outfile << p << endl;
    }
    outfile.close();
    //File Reading
    ifstream infile("min_max.txt");
    int p;
    while (infile >> p)
    {
        v.pb(p);
    }
    BruteForce(v);
    cout << "Bruteforce min-max\nMin: " << bf_min << "\nMax:" << bf_max<< endl;
    auto ans = recurMinMax(v, 0, v.size() - 1);
    cout << "Recursive min-max\nMin: " << ans.first << "\nMax:" << ans.second << endl;
}
int main()
{
    fast;
    int t = 1;
    // cin>>t;
    while (t--)
    {
        solve();
    }
}