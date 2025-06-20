public class Main {
    public static void main(String[] args) {
        EmployeeManagementSystem system = new EmployeeManagementSystem(5);

        // Add employees
        system.addEmployee(new Employee(101, "Alice", "Manager", 90000));
        system.addEmployee(new Employee(102, "Bob", "Developer", 75000));
        system.addEmployee(new Employee(103, "Charlie", "Designer", 60000));

        // Display
        system.displayAll();

        // Search
        Employee e = system.searchEmployee(102);
        if (e != null) {
            System.out.println("Search found: " + e.getName() + " (" + e.getPosition() + ")");
        } else {
            System.out.println("Employee not found.");
        }

        // Delete
        boolean deleted = system.deleteEmployee(102);
        System.out.println("Deleted: " + deleted);

        // Display after deletion
        system.displayAll();
    }
}
