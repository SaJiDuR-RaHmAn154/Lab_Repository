#include <bits/stdc++.h>
#include <gtest/gtest.h>

using namespace std;

// Component Interface
class Coffee {
public:
    virtual string getDescription() const = 0;
    virtual double getCost() const = 0;
    virtual ~Coffee() = default;
};

// Concrete Component
class SimpleCoffee : public Coffee {
public:
    string getDescription() const override {
        return "Simple Coffee";
    }

    double getCost() const override {
        return 5.0;
    }
};

// Abstract Decorator
class CoffeeDecorator : public Coffee {
protected:
    shared_ptr<Coffee> coffee;

public:
    CoffeeDecorator(shared_ptr<Coffee> coffee) : coffee(std::move(coffee)) {}

    string getDescription() const override {
        return coffee->getDescription();
    }

    double getCost() const override {
        return coffee->getCost();
    }
};

// Concrete Decorators
class MilkDecorator : public CoffeeDecorator {
public:
    MilkDecorator(shared_ptr<Coffee> coffee) : CoffeeDecorator(std::move(coffee)) {}

    string getDescription() const override {
        return coffee->getDescription() + ", Milk";
    }

    double getCost() const override {
        return coffee->getCost() + 1.5;
    }
};

class SugarDecorator : public CoffeeDecorator {
public:
    SugarDecorator(shared_ptr<Coffee> coffee) : CoffeeDecorator(std::move(coffee)) {}

    string getDescription() const override {
        return coffee->getDescription() + ", Sugar";
    }

    double getCost() const override {
        return coffee->getCost() + 0.5;
    }
};

class WhippedCreamDecorator : public CoffeeDecorator {
public:
    WhippedCreamDecorator(shared_ptr<Coffee> coffee) : CoffeeDecorator(std::move(coffee)) {}

    string getDescription() const override {
        return coffee->getDescription() + ", Whipped Cream";
    }

    double getCost() const override {
        return coffee->getCost() + 2.0;
    }
};

// Main method for testing
int main(int argc, char** argv) {
    cout << "Testing Decorator Pattern Example..." << endl;

    // Run tests
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

// Google Test Cases
TEST(CoffeeShopTest, SimpleCoffeeTest) {
    shared_ptr<Coffee> coffee = make_shared<SimpleCoffee>();

    EXPECT_EQ(coffee->getDescription(), "Simple Coffee");
    EXPECT_DOUBLE_EQ(coffee->getCost(), 5.0);
}

TEST(CoffeeShopTest, CoffeeWithMilkTest) {
    shared_ptr<Coffee> coffee = make_shared<SimpleCoffee>();
    coffee = make_shared<MilkDecorator>(coffee);

    EXPECT_EQ(coffee->getDescription(), "Simple Coffee, Milk");
    EXPECT_DOUBLE_EQ(coffee->getCost(), 6.5);
}

TEST(CoffeeShopTest, CoffeeWithMilkAndSugarTest) {
    shared_ptr<Coffee> coffee = make_shared<SimpleCoffee>();
    coffee = make_shared<MilkDecorator>(coffee);
    coffee = make_shared<SugarDecorator>(coffee);

    EXPECT_EQ(coffee->getDescription(), "Simple Coffee, Milk, Sugar");
    EXPECT_DOUBLE_EQ(coffee->getCost(), 7.0);
}

TEST(CoffeeShopTest, CoffeeWithAllDecoratorsTest) {
    shared_ptr<Coffee> coffee = make_shared<SimpleCoffee>();
    coffee = make_shared<MilkDecorator>(coffee);
    coffee = make_shared<SugarDecorator>(coffee);
    coffee = make_shared<WhippedCreamDecorator>(coffee);

    EXPECT_EQ(coffee->getDescription(), "Simple Coffee, Milk, Sugar, Whipped Cream");
    EXPECT_DOUBLE_EQ(coffee->getCost(), 9.0);
}