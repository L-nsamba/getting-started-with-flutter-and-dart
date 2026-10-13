import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
    );
  }
}