#include<iostream>
#include "gtest/gtest.h"

using namespace std;

TEST(Testname, Subtest_1) {
    ASSERT_TRUE(1==2);
}

TEST(Testname, Subtest_2) {
    ASSERT_TRUE(1==1);
}

int main(int argc, char **argv) {
    cout << "Hello, World!" << endl;
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}