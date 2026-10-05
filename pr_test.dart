import 'dart:ffi';

import 'employeeclass.dart';
import 'bookclass.dart';

void main() {
  // SESSION 2
  Employee employee_one = Employee("Allison Becker", 1324.50, "Marketing");

  // print(employee_one._salary);

  employee_one.displayInfo();

  var salary = employee_one.getSalary();
  print(salary);
  print("");
}
