public class EmployeeManagementSystem {
    private Employee[] employees;
    private int size;

    public EmployeeManagementSystem(int capacity) {
        employees = new Employee[capacity];
        size = 0;
    }

    //Add Employee
    public boolean addEmployee(Employee e){
        if(size >= employees.length){
            System.out.println("Employee Array is Full");
            return false;
        }
        employees[size++] = e;
        return true;
    }

    //Search Employee
    public Employee searchEmployee(int employeeId){
        for(int i = 0 ; i < size ; i++){
            if(employees[i].getEmployeeId() == employeeId){
                return employees[i];
            }
        }
        return null;
    }

    //Traverse or display the Array
    public void displayAll(){
        if(size == 0){
            System.out.println("No Employee Found");
            return;
        }
        for(int i = 0 ; i < size ; i++){
            Employee e = employees[i];
            System.out.println(
                "Id : " + e.getEmployeeId() + 
                ", Name : " + e.getName() +
                ", Position : " + e.getPosition() +
                ", Salary : " + e.getSalary()
            );
        }
    }

    //Delete an Employee
    public boolean deleteEmployee(int employeeId){
        for(int i = 0 ; i < size ; i++){
            if(employees[i].getEmployeeId() == employeeId){
                for(int j = i ; j < size - 1 ; j++){
                    employees[j] = employees[j + 1];
                }
                employees[size--] = null;
                return true;
            }
        }
        return false;
    }
}
