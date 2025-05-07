import java.util.ArrayList;
import java.util.List;

// Component
interface Employee {
    void showDetails();
}

// Leaf
class Teacher implements Employee {
    private String name;
    private String subject;

    public Teacher(String name, String subject) {
        this.name = name;
        this.subject = subject;
    }

    @Override
    public void showDetails() {
        System.out.println("Teacher: " + name + ", Subject: " + subject);
    }
}

// Composite - Department
class Department implements Employee {
    private String deptName;
    private List<Employee> employees = new ArrayList<>();

    public Department(String deptName) {
        this.deptName = deptName;
    }

    public void addEmployee(Employee e) {
        employees.add(e);
    }

    public void removeEmployee(Employee e) {
        employees.remove(e);
    }

    @Override
    public void showDetails() {
        System.out.println("Department: " + deptName);
        for (Employee e : employees) {
            e.showDetails();
        }
    }
}

// Composite - University
class University implements Employee {
    private String universityName;
    private List<Employee> departments = new ArrayList<>();

    public University(String universityName) {
        this.universityName = universityName;
    }

    public void addDepartment(Employee department) {
        departments.add(department);
    }

    public void removeDepartment(Employee department) {
        departments.remove(department);
    }

    @Override
    public void showDetails() {
        System.out.println("University: " + universityName);
        for (Employee dept : departments) {
            dept.showDetails();
        }
    }
}

// Client
public class UniversityCompositeDemo {
    public static void main(String[] args) {
        // Create leaf nodes (teachers)
        Employee teacher1 = new Teacher("Dr. Smith", "Computer Science");
        Employee teacher2 = new Teacher("Prof. Johnson", "Mathematics");
        Employee teacher3 = new Teacher("Dr. Brown", "Physics");

        // Create departments and add teachers
        Department csDept = new Department("Computer Science Department");
        csDept.addEmployee(teacher1);

        Department mathDept = new Department("Mathematics Department");
        mathDept.addEmployee(teacher2);

        Department sciDept = new Department("Science Department");
        sciDept.addEmployee(teacher3);

        // Create university and add departments
        University myUniversity = new University("OpenAI University");
        myUniversity.addDepartment(csDept);
        myUniversity.addDepartment(mathDept);
        myUniversity.addDepartment(sciDept);

        // Display the entire hierarchy
        myUniversity.showDetails();
    }
}
