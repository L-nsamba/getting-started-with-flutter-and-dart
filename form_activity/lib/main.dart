import 'package:flutter/material.dart';
import 'package:form_activity/screens/register.dart';


void main(){
  runApp(RegistrationForm());

}

// root of the application
class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}