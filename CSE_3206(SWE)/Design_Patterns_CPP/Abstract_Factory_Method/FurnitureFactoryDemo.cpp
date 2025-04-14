#include <bits/stdc++.h>
#include <gtest/gtest.h>

using namespace std;

// Abstract Product: Chair
class Chair {
public:
    virtual void sitOn() const = 0;
    virtual ~Chair() = default;
};

// Abstract Product: Sofa
class Sofa {
public:
    virtual void relaxOn() const = 0;
    virtual ~Sofa() = default;
};

// Concrete Product: Modern Chair
class ModernChair : public Chair {
public:
    void sitOn() const override {
        cout << "Sitting on a modern chair." << endl;
    }
};

// Concrete Product: Victorian Chair
class VictorianChair : public Chair {
public:
    void sitOn() const override {
        cout << "Sitting on a victorian chair." << endl;
    }
};

// Concrete Product: Modern Sofa
class ModernSofa : public Sofa {
public:
    void relaxOn() const override {
        cout << "Relaxing on a modern sofa." << endl;
    }
};

// Concrete Product: Victorian Sofa
class VictorianSofa : public Sofa {
public:
    void relaxOn() const override {
        cout << "Relaxing on a victorian sofa." << endl;
    }
};

// Abstract Factory
class FurnitureFactory {
public:
    virtual unique_ptr<Chair> createChair() const = 0;
    virtual unique_ptr<Sofa> createSofa() const = 0;
    virtual ~FurnitureFactory() = default;
};

// Concrete Factory: Modern Furniture
class ModernFurnitureFactory : public FurnitureFactory {
public:
    unique_ptr<Chair> createChair() const override {
        return make_unique<ModernChair>();
    }

    unique_ptr<Sofa> createSofa() const override {
        return make_unique<ModernSofa>();
    }
};

// Concrete Factory: Victorian Furniture
class VictorianFurnitureFactory : public FurnitureFactory {
public:
    unique_ptr<Chair> createChair() const override {
        return make_unique<VictorianChair>();
    }

    unique_ptr<Sofa> createSofa() const override {
        return make_unique<VictorianSofa>();
    }
};

// Client
class FurnitureStore {
private:
    unique_ptr<Chair> chair;
    unique_ptr<Sofa> sofa;

public:
    FurnitureStore(const FurnitureFactory& factory) {
        chair = factory.createChair();
        sofa = factory.createSofa();
    }

    string displayFurniture() const {
        stringstream output;
        streambuf* oldCoutBuffer = cout.rdbuf(output.rdbuf());

        chair->sitOn();
        sofa->relaxOn();

        cout.rdbuf(oldCoutBuffer);
        return output.str();
    }
};

// Main method
int main(int argc, char** argv) {
    string style = "modern";

    unique_ptr<FurnitureFactory> factory;
    if (style == "modern") {
        factory = make_unique<ModernFurnitureFactory>();
    } else {
        factory = make_unique<VictorianFurnitureFactory>();
    }

    FurnitureStore store(*factory);
    cout << store.displayFurniture();

    // Run tests
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

// Google Test Cases
TEST(FurnitureFactoryTest, ModernFurnitureTest) {
    ModernFurnitureFactory factory;
    FurnitureStore store(factory);

    string output = store.displayFurniture();
    EXPECT_NE(output.find("Sitting on a modern chair."), string::npos);
    EXPECT_NE(output.find("Relaxing on a modern sofa."), string::npos);
}

TEST(FurnitureFactoryTest, VictorianFurnitureTest) {
    VictorianFurnitureFactory factory;
    FurnitureStore store(factory);

    string output = store.displayFurniture();
    EXPECT_NE(output.find("Sitting on a victorian chair."), string::npos);
    EXPECT_NE(output.find("Relaxing on a victorian sofa."), string::npos);
}