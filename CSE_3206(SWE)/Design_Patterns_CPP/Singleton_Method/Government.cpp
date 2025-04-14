#include <bits/stdc++.h>
#include <mutex>
#include <gtest/gtest.h>

using namespace std;

class Government {
private:
    static Government* instance;
    static mutex mtx;

    // Private constructor to prevent instantiation
    Government() {
        cout << "\nA new government has been formed." << endl;
    }

public:
    // Delete copy constructor and assignment operator to enforce singleton
    Government(const Government&) = delete;
    Government& operator=(const Government&) = delete;

    // Static method to get the singleton instance
    static Government* getInstance() {
        lock_guard<mutex> lock(mtx);
        if (instance == nullptr) {
            instance = new Government();
        }
        return instance;
    }

    // Method to simulate government action
    void govern(const string& message) {
        cout << "Government action: " << message << endl;
    }
};

// Initialize static members
Government* Government::instance = nullptr;
mutex Government::mtx;

// Main method for testing
int main(int argc, char** argv) {
    cout << "Testing Singleton Government class..." << endl;

    // Run tests
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

// Google Test Cases
TEST(GovernmentTest, SingletonInstanceTest) {
    Government* gov1 = Government::getInstance();
    Government* gov2 = Government::getInstance();

    // Both instances should point to the same object
    EXPECT_EQ(gov1, gov2);
}

TEST(GovernmentTest, GovernActionTest) {
    Government* gov = Government::getInstance();

    // Capture the output of the govern method
    testing::internal::CaptureStdout();
    gov->govern("Implementing new policies.");
    string output = testing::internal::GetCapturedStdout();

    EXPECT_NE(output.find("Government action: Implementing new policies."), string::npos);
}