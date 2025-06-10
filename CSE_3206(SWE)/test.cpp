#include <iostream>
#include <memory>
#include <string>
#include <gtest/gtest.h>

class BankAccount
{
protected:
    std::string accountNumber;
    double balance;

public:
    BankAccount(const std::string &accNum, double initial)
        : accountNumber(accNum), balance(initial) {}

    virtual std::string getAccountType() const = 0;

    virtual void deposit(double amount)
    {
        balance += amount;
    }

    virtual bool withdraw(double amount)
    {
        if (amount > balance) return false;
        balance -= amount;
        return true;
    }

    double getBalance() const
    {
        return balance;
    }

    virtual ~BankAccount() = default;
};

class SavingsAccount : public BankAccount
{
public:
    SavingsAccount(const std::string &accNum, double initial)
        : BankAccount(accNum, initial) {}

    std::string getAccountType() const override
    {
        return "SavingsAccount";
    }
};

class CheckingAccount : public BankAccount
{
public:
    CheckingAccount(const std::string &accNum, double initial)
        : BankAccount(accNum, initial) {}

    std::string getAccountType() const override
    {
        return "CheckingAccount";
    }
};

class BusinessAccount : public BankAccount
{
public:
    BusinessAccount(const std::string &accNum, double initial)
        : BankAccount(accNum, initial) {}

    std::string getAccountType() const override
    {
        return "BusinessAccount";
    }
};

class AccountFactory
{
public:
    static std::unique_ptr<BankAccount> createAccount(const std::string &type,
                                                      const std::string &accNum,
                                                      double initialDeposit)
    {
        if (type == "savings")
            return std::make_unique<SavingsAccount>(accNum, initialDeposit);
        else if (type == "checking")
            return std::make_unique<CheckingAccount>(accNum, initialDeposit);
        else if (type == "business")
            return std::make_unique<BusinessAccount>(accNum, initialDeposit);
        else
            return nullptr;
    }
};

TEST(AccountFactoryTest, CreateSavingsAccount)
{
    auto acc = AccountFactory::createAccount("savings", "SAV001", 1000.0);
    ASSERT_NE(acc, nullptr);
    EXPECT_EQ(acc->getAccountType(), "SavingsAccount");
    EXPECT_DOUBLE_EQ(acc->getBalance(), 1000.0);
}

TEST(AccountFactoryTest, DepositAndWithdraw)
{
    auto acc = AccountFactory::createAccount("checking", "CHK001", 500.0);
    acc->deposit(100.0);
    EXPECT_DOUBLE_EQ(acc->getBalance(), 600.0);
    EXPECT_TRUE(acc->withdraw(200.0));
    EXPECT_DOUBLE_EQ(acc->getBalance(), 400.0);
    EXPECT_FALSE(acc->withdraw(1000.0)); // Should fail
}

TEST(AccountFactoryTest, InvalidAccountTypeReturnsNull)
{
    auto acc = AccountFactory::createAccount("crypto", "CRY123", 1000.0);
    EXPECT_EQ(acc, nullptr);
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}