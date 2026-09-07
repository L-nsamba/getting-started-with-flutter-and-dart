import 'dart:ffi';

import 'dart.io';

void main() {
  print("Hello world");
  num weight = 30.12313;
  double age = 12;
  print(weight.ceil());
  print(age);

  String name = "PASCALTHERASCAL";
  print(name.toLowerCase());

  dynamic day = 1;
  day = 2;

  Map<String, double> employee = {"James": 12, "Peter": 50, "Jonah": 100};

  // print(employee["James"]);

  employee.forEach((key, value) => print(key));

  var ids = {1, 2, 3, 4, 5}; // Set {} and order does not matter
  var nums = (1, 2, 2, 3, 4); // Tuple () and order matters

  // num myage = 1;
  var myage = 1;
  print("My age is $myage years");

  // int ? a;
  // print(a);

  print("Enter your name: ");
  String ?  name 
}
