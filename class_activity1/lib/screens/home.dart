import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  const new({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Let's Play", style: TextStyle(fontSize: 34.0, color: Colors.white)),
          Image.asset("images/dice-1.png"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text("Roll Dice", style: TextStyle(fontSize: 34.0)),
          ),
        ],
      ),
    );
  }
}
