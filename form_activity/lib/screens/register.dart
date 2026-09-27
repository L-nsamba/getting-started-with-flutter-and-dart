import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum Gender { Male, Female }

bool machineLearningSelected = false;
bool fullStackSelected = false;
bool mobileApplicationSelected = false;

class _RegisterScreenState extends State<RegisterScreen> {
  Gender? _selectedgender = .Female;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Welcome back!!!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),

      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Username"),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Text("Password"),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text("Sex"),
                  SizedBox(width: 50.0),

                  RadioGroup<Gender>(
                    groupValue: _selectedgender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _selectedgender = value;
                      });
                    },
                    child: Row(
                      children: [
                        Radio<Gender>(value: Gender.Male),
                        Text("Male"),

                        Radio<Gender>(value: Gender.Female),
                        Text("Female"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Courses"),

                  SizedBox(width: 80.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: machineLearningSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                machineLearningSelected = value ?? false;
                              });
                            },
                          ),
                          Text("Machine Learning"),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: mobileApplicationSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                mobileApplicationSelected = value ?? false;
                              });
                            },
                          ),
                          Text("Mobile App Dev"),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: fullStackSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                fullStackSelected = value ?? false;
                              });
                            },
                          ),
                          Text("Full stack"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
