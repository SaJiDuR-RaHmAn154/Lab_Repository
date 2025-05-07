#include <iostream>
#include <gtest/gtest.h>

using namespace std;

int multiply(int a, int b) {
    return a * b;
}

TEST(MultiplyTests, PositiveNumbers) {
    EXPECT_EQ(multiply(2, 3), 6);
}

TEST(MultiplyTests, OneNegative) {
    EXPECT_EQ(multiply(4, -5), -20);
}

TEST(MultiplyTests, TwoNegatives) {
    EXPECT_EQ(multiply(-6, -7), 42);
}

TEST(MultiplyTests, ZeroCase) {
    EXPECT_EQ(multiply(0, 5), 0);
    EXPECT_EQ(multiply(-3, 0), 0);
}


int main(int argc, char **argv) {
    cout << "Testing multiplication" << endl;
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}