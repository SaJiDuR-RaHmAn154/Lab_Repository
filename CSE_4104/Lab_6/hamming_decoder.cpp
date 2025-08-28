#include <bits/stdc++.h>
using namespace std;

bool isPowerOfTwo(int x)
{
	return ((x & (x - 1)) == 0);
}

int calculateErrorPosition(vector<int> &codeword, int m)
{
	int errorPosition = 0;
	for (int p = 1; p <= m; p <<= 1)
	{
		int sum = 0;
		for (int j = p; j <= m; j++)
		{
			if (j & p)
				sum += codeword[j];
		}
		if (sum % 2)
			errorPosition += p; 
	}
	return errorPosition;
}

int main()
{
	int m;
	cout << "\nEnter number of received bits: ";
	cin >> m;

	string rec;
	cout << "Enter received codeword (" << m << " bits): ";
	cin >> rec;

	vector<int> codeword(m + 1);

	for (int i = 1; i <= m; ++i)
	{
		codeword[i] = rec[m - i] - '0';
	}

	int errorPosition = calculateErrorPosition(codeword, m);

	if (errorPosition == 0)
	{
		cout << "No error detected. Codeword is correct.\n";
	}
	else if (errorPosition >= 1 && errorPosition <= m)
	{
		cout << "Error detected at position " << errorPosition << "\n";
		codeword[errorPosition] ^= 1;
		cout << "Corrected codeword: ";
		for (int pos = m; pos >= 1; --pos)
			cout << codeword[pos];
		cout << '\n';
	}
	else{
		cout << "Error occurred in multiple bits. Hamming code can't correct this.\n";
		return 0;
	}

	vector<int> dataPositions;
	for (int pos = 1; pos <= m; ++pos)
	{
		if (!isPowerOfTwo(pos))
		{
			dataPositions.push_back(pos);
		}
	}
	cout << "Original data bits: ";
	for (int i = dataPositions.size() - 1; i >= 0; --i)
	{
		cout << codeword[dataPositions[i]];
	}
	cout << '\n';

	return 0;
}
