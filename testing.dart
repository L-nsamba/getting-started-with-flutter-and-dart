class Employee {
  String name;
  double _salary;
  String department;

  Employee(this.name, this._salary, this.department);

  void displayInfo() {
    print("Employee name $name");
    print("Employee salary $_salary");
    print("Employee department $department");
  }
}
