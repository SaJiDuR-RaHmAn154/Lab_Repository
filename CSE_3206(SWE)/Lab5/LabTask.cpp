#include <iostream>
#include "gtest/gtest.h"

using namespace std;

int multiply(int a, int b) {
    return a * b;
}

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

TEST(MultiplyTests, PositiveNumbers) {
    EXPECT_EQ(multiply(2, 3), 6);
}

TEST(MultiplyTests, OneNegative) {
    EXPECT_EQ(multiply(4, -5), -20);
}

TEST(MultiplyTests, TwoNegatives) {
    EXPECT_EQ(multiply(-6, -7), -42);
}

TEST(MultiplyTests, ZeroCase) {
    EXPECT_EQ(multiply(0, 5), 0);
    EXPECT_EQ(multiply(-3, 0), 0);
}

TEST(AdditionTests, PositiveNumbers) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(AdditionTests, OneNegative) {
    EXPECT_EQ(add(4, -5), -1);
}

TEST(AdditionTests, TwoNegatives) {
    EXPECT_EQ(add(-6, -7), -13);
}

TEST(AdditionTests, ZeroCase) {
    EXPECT_EQ(add(0, 5), 5);
    EXPECT_EQ(add(-3, 0), -3);
}

TEST(SubtractionTests, PositiveNumbers) {
    EXPECT_EQ(subtract(5, 3), 2);
}

TEST(SubtractionTests, OneNegative) {
    EXPECT_EQ(subtract(4, -5), 9);
}

TEST(SubtractionTests, TwoNegatives) {
    EXPECT_EQ(subtract(-6, -7), 1);
}

TEST(SubtractionTests, ZeroCase) {
    EXPECT_EQ(subtract(0, 5), -5);
    EXPECT_EQ(subtract(-3, 0), -3);
}

int main(int argc, char **argv) {
    cout << "Testing multiplication, addition, and subtraction" << endl;
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}