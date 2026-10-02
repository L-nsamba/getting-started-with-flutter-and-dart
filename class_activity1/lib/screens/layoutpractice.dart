import 'package:flutter/material.dart';

class DiceGrid extends StatelessWidget {
  const DiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text("Gridview Widget", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
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
            Text(
              "Tap the button below to roll the dice",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pop(context);
          Navigator.pushNamed(
            context,
            '/rolldice',
            arguments: nameController.text,
          );
        },
        child: Icon(Icons.skip_next),
      ),
    );
  }
}
