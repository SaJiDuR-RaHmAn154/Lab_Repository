#include<bits/stdc++.h>
// #include<ext/pb_ds/assoc_container.hpp>
#include<ext/pb_ds/tree_policy.hpp>
#pragma GCC optimize("Ofast,unroll-loops")
using namespace std;
using namespace __gnu_pbds;


//Primitive Data Type
typedef long long ll;
typedef long double ld;
typedef unsigned long long ull;

//STL
#define umap unordered_map
#define uset unordered_set
#define sz(v) (int)v.size()
#define vi vector<int>
#define vll vector<ll>
#define vvi vector<vi>
#define vvl vector<vl>
#define vs vector<string>
#define pii pair<int,int>
#define pll pair<ll,ll>
#define vpii vector<pii>
#define vpll vector<pll>
#define mi map<int,int>
#define mll map<ll,ll>
#define pb push_back
#define eb emplace_back
#define pob pop_back
#define pf pop_front
#define mp make_pair
#define ff first
#define ss second
#define nl '\n'
#define fo(i,a,b) for(int i=a;i<b;++i)
#define re(i,a,b) for(int i=a;i>=b;--i)
#define itr(it, v) for(auto it = v.begin(); it != v.end(); it++)
#define fr(x, v) for(auto &x:v)
#define all(v) v.begin(),v.end()
#define rev(v) reverse(all(v))
#define srt(v) sort(all(v))
#define grtsrt(v) sort(all(v),greater<ll>())
#define tl(v)  transform(all(v),v.begin(),::tolower)
#define tu(v)  transform(all(v),v.begin(),::toupper)
#define lb(v,x) *lower_bound(all(v),x)
#define ub(v,x) *upper_bound(all(v),x)
#define mn(v) *min_element(all(v))
#define mx(v) *max_element(all(v))
#define mem(a,x) memset(a,x,sizeof(a))

//Bit Operations
#define set_bit(x,k) (x|=(1LL<<k))
#define uset_bit(x,k) (x &= ~(1LL<<k))
#define check_bit(x,k) (x & (1LL<<k))
#define toggle_bit(x,k) (x ^ (1LL<<k))
#define one(x) __builtin_popcountll(x)
#define zero(x) __builtin_clz(x)
inline ll binaryToDecimal(string n){string num = n;ll dec_value = 0;int base = 1;int len = num.length();for(int i = len - 1; i >= 0; i--){if (num[i] == '1')dec_value += base;base = base * 2;}return dec_value;}
inline string decToBinary(int n){string s="";int i = 0;while (n > 0) {s =to_string(n % 2)+s;n = n / 2;i++;}return s;}

//Input_Output
#define ys cout<<"YES\n"
#define no cout<<"NO\n"
#define deb1(x) cout << #x << "=" << x << endl
#define deb2(x, y) cout << #x << "=" << x << "," << #y << "=" << y << endl
#define fout(x) fixed<<setprecision(x)

//Fast IO
#define fast ios_base::sync_with_stdio(false),cin.tie(0),cout.tie(0)
//Mathmatical Functions
inline ll GCD(ll a, ll b) { return b == 0 ? a : GCD(b, a % b); }
inline ll LCM(ll a, ll b) { return a * b / GCD(a, b); }
inline double logb(ll base,ll num){ return (double)log(num)/(double)log(base);}
inline bool isPowerOfTwo(ll n){if(n<=0)return false;return (ceil(log2(n)) == floor(log2(n)));}
inline bool isPerfectSquare(ll x){if (x >= 0) {ll sr = sqrt(x);return (sr * sr == x);}return false;}

//Operator Overloads
template<typename T1, typename T2> // cin >> pair<T1, T2>
istream& operator>>(istream &istream, pair<T1, T2> &p) { return (istream >> p.ff >> p.ss); }
template<typename T> // cin >> vector<T>
istream& operator>>(istream &istream, vector<T> &v){for (auto &it : v)cin >> it;return istream;}
template<typename T1, typename T2> // cout << pair<T1, T2>
ostream& operator<<(ostream &ostream, const pair<T1, T2> &p) { return (ostream << p.ff << " " << p.ss); }
template<typename T> // cout << vector<T>
ostream& operator<<(ostream &ostream, const vector<T> &c) { for (auto &it : c) cout << it << " "; return ostream; }
template<typename T1,typename T2>//cin>>vector<pair<T1,T2>>
istream& operator>>(istream &istream,vector<pair<T1,T2>>&v){for(int i=0;i<sz(v);i++)istream>>v[i].ff>>v[i].ss;return istream;}
template<typename T1,typename T2>//cout<<vector<pair<T1,T2>>
ostream& operator<<(ostream &ostream,const vector<pair<T1,T2>>&v){for(auto &it:v)ostream<<it.ff<<" "<<it.ss<<nl;return ostream;}

//Debug
#ifdef Debug
#define debug(x) cerr << #x<<" "; cerr<<x<<" "; cerr << endl;
#else
#define debug(x);
#endif

void setIO()
{
    #ifndef ONLINE_JUDGE
        freopen("input.txt","r",stdin);
        freopen("output.txt","w",stdout);
    #endif
}

//Constants
#define pi acos(-1)
const double eps = 1e-6;
const int N=1e5+10;
const int M=1e9+7;
const ll INF= LONG_LONG_MAX;


int b[N];
void Merge(vector<int>&v, int l, int mid, int h)
{
    int i = l, k = l, j = mid + 1;
    while (i <= mid and j <= h)
    {
        if (v[i] >= v[j])
        {
            b[k] = v[j];
            k++;
            j++;
        }
        else
        {
            b[k] = v[i];
            k++;
            i++;
        }
    }
    while (i <= mid)
    {
        b[k] = v[i];
        k++;
        i++;
    }
    while (j <= h)
    {
        b[k] = v[j];
        k++;
        j++;
    }
    fo(k, l, h + 1) v[k] = b[k];
}
void MergeSort(vector<int>&v, int l, int h)
{
    int mid = (l + h) / 2;
    if (l < h)
    {
        MergeSort(v, l, mid);
        MergeSort(v, mid + 1, h);
        Merge(v, l, mid, h);
    }
}
void solve()
{
    int n;
    cin>>n;
    vector<int>v;
    //File Writting
    ofstream outfile("MergeSort.txt");
    for(int i=0;i<n;i++)
    {
      int p=rand()%(2*n);
      outfile<<p<<endl;
    }
    outfile.close();
    //File Reading
    ifstream infile("MergeSort.txt");
    int p;
    while(infile>>p)
    {
      v.pb(p);
    }
    cout<<"Unsorted Array: "<<v<<endl;
    MergeSort(v,0,n-1);
    cout<<"Sorted Array: "<<v<<endl;
    
}
int main()
{
    fast;
    //setIO();
    int t=1;
    //cin>>t;
    while(t--)
    {
      solve();
    }
    return 0;
}