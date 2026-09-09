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

  void setSalary(double, amount) {
    this._salary = _salary;
  }

  double getSalary() {
    return _salary;
  }
}

class Intern extends Employee {
  int contract_len;
  Intern(super.name, super._salary, super.department, this.contract_len);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Contract length: $contract_len");
  }
}