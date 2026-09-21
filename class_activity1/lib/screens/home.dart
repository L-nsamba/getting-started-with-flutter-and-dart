import 'package:flutter/material.dart';

import '../logic/randomval.dart';

class RollDice extends StatefulWidget {
  const new({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int diceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's Play",
                style: TextStyle(fontSize: 34.0, color: Colors.white),
              ),
              Image.asset("images/dice-$diceNumber.png"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                  diceNumber = generateNumber();
                  });
                },
                child: Text("Roll Dice", style: TextStyle(fontSize: 34.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
