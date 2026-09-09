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

  Intern intern1 = Intern("angelica", 1234, "Sales", 6);
  intern1.displayInfo();

  Book book_one = Book("Oliver Twist", "Charles Dickens", 1234.56);
  print("");
  book_one.display();
}
