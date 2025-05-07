#include <bits/stdc++.h>
#include <mutex>
#include <gtest/gtest.h>

using namespace std;

class StudentManager
{
private:
    vector<string> students;

    StudentManager()
    {
        cout << "StudentManager object created" << endl;
    }

public:
    // Singleton instance
    static StudentManager &getInstance()
    {
        static StudentManager instance;
        return instance;
    }

    // addStudent functionality
    void addStudent(string &name)
    {
        students.push_back(name);
    }

    // removeStudent functionality
    void removeStudent(string &name)
    {
        auto it = find(students.begin(), students.end(), name);
        if (it != students.end())
        {
            students.erase(it);
        }
    }

    // printStudents functionality
    void printStudents()
    {
        cout << "Students: ";
        for (auto &student : students)
        {
            cout << student << " ";
        }
        cout << endl;
    }

    vector<string> getStudents()
    {
        return students;
    }
};

TEST(StudentManagerTest, AddStudentTest)
{
    StudentManager &manager = StudentManager::getInstance();
    string student1 = "Alice";
    string student2 = "Bob";

    manager.addStudent(student1);
    manager.addStudent(student2);

    vector<string> students = manager.getStudents();
    EXPECT_EQ(students.size(), 2);
    EXPECT_EQ(students[0], "Alice");
    EXPECT_EQ(students[1], "Bob");
}

TEST(StudentManagerTest, RemoveStudentTest)
{
    StudentManager &manager = StudentManager::getInstance();
    string student1 = "Alice";
    string student2 = "Bob";

    manager.addStudent(student1);
    manager.addStudent(student2);
    manager.removeStudent(student1);

    vector<string> students = manager.getStudents();
    EXPECT_EQ(students.size(), 1);
    EXPECT_EQ(students[0], "Bob");
}


int main(int argc, char **argv)
{
    cout << "Testing StudentManager class..." << endl;
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}