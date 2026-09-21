import 'package:class_activity1/screens/layoutpractice.dart';
import 'package:flutter/material.dart';

// define entry
void main() {
  runApp(MyApp());
}

// root application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: RollDice(),
      home:  DiceGrid(),
    );
  }
}
