import 'package:class_activity1/screens/layoutpractice.dart';
import 'package:flutter/material.dart';

import '../logic/randomval.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int diceNumber = 1;
  String userName = ''; 


  @override
    void didChangeDependencies() {
    super.didChangeDependencies();
    userName = (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Player';
  }
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
                "Welcome $userName! Lets Play",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) =>  DiceGrid()));

          Navigator.pushNamed(context, "/");
        },
        child: Icon(Icons.skip_previous),
      ),
    );
  }
}
