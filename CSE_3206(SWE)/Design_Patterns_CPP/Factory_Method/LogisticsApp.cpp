#include <bits/stdc++.h>
#include <sstream>
#include <gtest/gtest.h>

using namespace std;

// Step 1: Product Interface
class Transport {
public:
    virtual void deliver(ostream& out) const = 0;
    virtual ~Transport() = default;
};

// Step 2: Concrete Products
class RoadTransport : public Transport {
public:
    void deliver(ostream& out) const override {
        out << "Delivering by road using a truck." << endl;
    }
};

class SeaTransport : public Transport {
public:
    void deliver(ostream& out) const override {
        out << "Delivering by sea using a ship." << endl;
    }
};

// Step 3: Creator (Abstract Factory)
class Logistics {
public:
    virtual unique_ptr<Transport> createTransport() const = 0;

    void planDelivery(ostream& out) const {
        auto transport = createTransport();
        transport->deliver(out);
    }

    virtual ~Logistics() = default;
};

// Step 4: Concrete Creators
class RoadLogistics : public Logistics {
public:
    unique_ptr<Transport> createTransport() const override {
        return make_unique<RoadTransport>();
    }
};

class SeaLogistics : public Logistics {
public:
    unique_ptr<Transport> createTransport() const override {
        return make_unique<SeaTransport>();
    }
};

// Test Cases
TEST(LogisticsTest, RoadLogisticsDelivery) {
    RoadLogistics roadLogistics;
    stringstream output;
    roadLogistics.planDelivery(output);
    EXPECT_EQ(output.str(), "Delivering by road using a truck.\n");
}

TEST(LogisticsTest, SeaLogisticsDelivery) {
    SeaLogistics seaLogistics;
    stringstream output;
    seaLogistics.planDelivery(output);
    EXPECT_EQ(output.str(), "Delivering by sea using a Ship.\n");
}

// Main function for running tests
int main(int argc, char** argv) {
    cout << "Running tests for LogisticsApp" << endl;
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}