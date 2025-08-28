#include <bits/stdc++.h>
using namespace std;

int calcParityBits(int n) {
    int r = 0;
    while ((1 << r) < (n + r + 1)) r++;
    cout << "Number of parity bits required: " << r << '\n';
    return r;
}

bool isPowerOfTwo(int x) {
    return ((x & (x - 1)) == 0);
}

void EvenParity(vector<int>& codeword, int m) {
    for (int p = 1; p <= m; p <<= 1) {
        int sum = 0;
        for (int j = p+1; j <= m; j++) {
            if (j & p) sum += codeword[j];
        }
        codeword[p] = sum % 2;
    }
}

int main() {
    int n;
    cout << "\nEnter number of data bits: ";
    cin >> n;

    string data;
    cout << "Enter " << n << "-bit data: ";
    cin >> data;

    int r = calcParityBits(n);
    int m = n + r; 
    vector<int> codeword(m + 1, 0); 

    vector<int> dataPositions;

    for (int pos = 1; pos <= m; ++pos) {
        if (!isPowerOfTwo(pos)) {
            dataPositions.push_back(pos);
        }
    }
    for (int i = 0; i < n; ++i) {
        codeword[dataPositions[i]] = data[n-1-i] - '0'; 
    }

    EvenParity(codeword, m);

    cout << "Encoded codeword (" << m << " bits): ";
    for (int pos = m; pos >= 1; --pos) cout << codeword[pos];
    cout << '\n';

    return 0;
}
