#include <bits/stdc++.h>
#include <gtest/gtest.h>
#include <memory>

using namespace std;

// Component
class Employee {
public:
    virtual void showDetails() const = 0;
    virtual string getDetails() const = 0; // Added getDetails to the base class
    virtual ~Employee() = default;
};

// Leaf
class Teacher : public Employee {
private:
    string name;
    string subject;

public:
    Teacher(const string& name, const string& subject) : name(name), subject(subject) {}

    void showDetails() const override {
        cout << "Teacher: " << name << ", Subject: " << subject << endl;
    }

    string getDetails() const override {
        return "Teacher: " + name + ", Subject: " + subject;
    }
};

// Composite - Department
class Department : public Employee {
private:
    string deptName;
    vector<shared_ptr<Employee>> employees;

public:
    Department(const string& deptName) : deptName(deptName) {}

    void addEmployee(shared_ptr<Employee> e) {
        employees.push_back(e);
    }

    void removeEmployee(shared_ptr<Employee> e) {
        employees.erase(remove(employees.begin(), employees.end(), e), employees.end());
    }

    void showDetails() const override {
        cout << "Department: " << deptName << endl;
        for (const auto& e : employees) {
            e->showDetails();
        }
    }

    string getDetails() const override {
        string details = "Department: " + deptName + "\n";
        for (const auto& e : employees) {
            details += e->getDetails() + "\n";
        }
        return details;
    }
};

// Composite - University
class University : public Employee {
private:
    string universityName;
    vector<shared_ptr<Employee>> departments;

public:
    University(const string& universityName) : universityName(universityName) {}

    void addDepartment(shared_ptr<Employee> department) {
        departments.push_back(department);
    }

    void removeDepartment(shared_ptr<Employee> department) {
        departments.erase(remove(departments.begin(), departments.end(), department), departments.end());
    }

    void showDetails() const override {
        cout << "University: " << universityName << endl;
        for (const auto& dept : departments) {
            dept->showDetails();
        }
    }

    string getDetails() const override {
        string details = "University: " + universityName + "\n";
        for (const auto& dept : departments) {
            details += dept->getDetails() + "\n";
        }
        return details;
    }
};

// Main method for testing
int main(int argc, char** argv) {
    cout << "Testing Composite Pattern Example..." << endl;

    // Run tests
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

// Google Test Cases
TEST(UniversityCompositeTest, ShowDetailsTest) {
    // Create leaf nodes (teachers)
    auto teacher1 = make_shared<Teacher>("Dr. Smith", "Computer Science");
    auto teacher2 = make_shared<Teacher>("Prof. Johnson", "Mathematics");
    auto teacher3 = make_shared<Teacher>("Dr. Brown", "Physics");

    // Create departments and add teachers
    auto csDept = make_shared<Department>("Computer Science Department");
    csDept->addEmployee(teacher1);

    auto mathDept = make_shared<Department>("Mathematics Department");
    mathDept->addEmployee(teacher2);

    auto sciDept = make_shared<Department>("Science Department");
    sciDept->addEmployee(teacher3);

    // Create university and add departments
    auto myUniversity = make_shared<University>("OpenAI University");
    myUniversity->addDepartment(csDept);
    myUniversity->addDepartment(mathDept);
    myUniversity->addDepartment(sciDept);

    // Capture output
    testing::internal::CaptureStdout();
    myUniversity->showDetails();
    string output = testing::internal::GetCapturedStdout();

    // Verify output
    EXPECT_NE(output.find("University: OpenAI University"), string::npos);
    EXPECT_NE(output.find("Department: Computer Science Department"), string::npos);
    EXPECT_NE(output.find("Teacher: Dr. Smith, Subject: Computer Science"), string::npos);
    EXPECT_NE(output.find("Department: Mathematics Department"), string::npos);
    EXPECT_NE(output.find("Teacher: Prof. Johnson, Subject: Mathematics"), string::npos);
    EXPECT_NE(output.find("Department: Science Department"), string::npos);
    EXPECT_NE(output.find("Teacher: Dr. Brown, Subject: Physics"), string::npos);
}