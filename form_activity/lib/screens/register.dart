import 'package:flutter/material.dart';
import 'package:form_activity/utils/validators.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  String gender = 'Male';
  List<String> selectedCourses = [];
  double tuition = 0;

  String? _courseError;
  String? _tuitionError;

  void _submitForm() {
    final isFormValid = _formKey.currentState!.validate();
    final courseError = Validators.courseValidator(selectedCourses);
    final tuitionError = Validators.tuitionValidator(tuition);

    setState(() {
      _courseError = courseError;
      _tuitionError = tuitionError;
    });

    if (isFormValid && courseError == null && tuitionError == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Form Submitted")));
    }
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _usernameController.clear();
    _passwordController.clear();
    _phonenumberController.clear();

    setState(() {
      gender = 'Male';
      selectedCourses.clear();
      tuition = 0;
      _courseError = null;
      _tuitionError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Back!!!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        toolbarHeight: 70.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  // Email
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _emailController,
                    validator: Validators.emailValidator,
                  ),

                  // Username
                  SizedBox(height: 16),
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    validator: Validators.usernameValidator,
                  ),
                  SizedBox(height: 16),

                  // TODO: add a field for collecting input from users below
                  // Phone Number
                  Text(
                    "Phone Number",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _phonenumberController,
                    validator: Validators.phoneNumberValidator,
                  ),

                  // Password
                  SizedBox(height: 16),
                  Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: Validators.passwordValidator,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),

                  // Gender
                  SizedBox(height: 16),
                  Text("Sex", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                      ),
                      Text("Male"),
                      Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                      ),
                      Text("Female"),
                    ],
                  ),

                  // Courses
                  SizedBox(height: 16),
                  Text(
                    "Courses",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Text("Machine Learning"),
                        value: selectedCourses.contains("ML"),
                        onChanged: (val) {
                          setState(() {
                            val!
                                ? selectedCourses.add("ML")
                                : selectedCourses.remove("ML");
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Full stack"),
                        value: selectedCourses.contains("FS"),
                        onChanged: (val) {
                          setState(() {
                            val!
                                ? selectedCourses.add("FS")
                                : selectedCourses.remove("FS");
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Mobile application"),
                        value: selectedCourses.contains("MA"),
                        onChanged: (val) {
                          setState(() {
                            val!
                                ? selectedCourses.add("MA")
                                : selectedCourses.remove("MA");
                          });
                        },
                      ),
                      if (_courseError != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 4),
                          child: Text(
                            _courseError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  ),

                  // Tuition
                  SizedBox(height: 16),
                  Text(
                    "Tuition",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: tuition,
                    min: 0,
                    max: 100,
                    activeColor: Colors.green,
                    onChanged: (value) => setState(() => tuition = value),
                  ),
                  if (_tuitionError != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4),
                      child: Text(
                        _tuitionError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),

                  // Buttons
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[200],
                        ),
                        onPressed: _submitForm,
                        child: Text("Submit"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: _clearForm,
                        child: Text("Clear"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
