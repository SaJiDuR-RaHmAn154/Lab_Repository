#include <iostream>
#include <stdexcept>
#include <gtest/gtest.h>

using namespace std;

class BankAccount
{
private:
    int balance = 0;

public:
    void deposit(int amount)
    {
        balance += amount;
        cout << amount << "Tk deposited successfully" << endl;
    }
    void withdraw(int amount)
    {
        if (amount > balance)
        {
            throw runtime_error("Error: Insufficient funds.");
        }
        else
        {
            balance -= amount;
            cout << amount << "Tk withdrawn successfully" << endl;
        }
    }
    int getBalance()
    {
        return balance;
    }
};

BankAccount account = BankAccount();

TEST(InitialBalanceTest, ZeroBalance)
{
    EXPECT_EQ(account.getBalance(), 10);
}

TEST(DepositBalanceTest, DepositBalanceIsCorrect)
{
    account.deposit(100);
    EXPECT_EQ(account.getBalance(), 100);
}

TEST(WithDraw, ValidWithdraw)
{
    account.withdraw(50);
    EXPECT_EQ(account.getBalance(), 50);
}

TEST(WithDraw, InvalidWithdraw)
{
    EXPECT_THROW(account.withdraw(500),runtime_error);
}

int main(int argc, char **argv)
{
    cout << "Running test for Bank Account" << endl;
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}