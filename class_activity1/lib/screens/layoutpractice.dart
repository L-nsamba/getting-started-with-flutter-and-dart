import 'package:flutter/material.dart';

class DiceGrid extends StatelessWidget {
  const DiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text("Gridview Widget", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Image.asset("images/dice-1.png"),
          Image.asset("images/dice-2.png"),
          Image.asset("images/dice-3.png"),
          Image.asset("images/dice-4.png"),
          Image.asset("images/dice-5.png"),
          Image.asset("images/dice-6.png"),
        ],
      ),
    );
  }
}
