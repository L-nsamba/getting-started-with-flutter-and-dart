import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum Gender { Male, Female }

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
          padding: const EdgeInsets.all(8.0),
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
              SizedBox(height: 15.0),
              Row(children: [Text("Gender"), SizedBox(width: 20.0)]),
              RadioGroup<Gender>(
                groupValue: _selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender = value;
                  });
                },
                child: Row(children: [],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
