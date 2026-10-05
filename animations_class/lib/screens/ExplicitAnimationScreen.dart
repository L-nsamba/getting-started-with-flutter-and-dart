import 'package:flutter/material.dart';

class ExplictAnimationScreen extends StatefulWidget {
  const ExplictAnimationScreen({super.key});

  @override
  State<ExplictAnimationScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExplictAnimationScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explict Animation')),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Icon(Icons.refresh, size: 100),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                _controller.forward();
              },
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              child: const Icon(Icons.arrow_forward),
            ),

            FloatingActionButton(
              onPressed: () {
                _controller.reverse();
              },
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              child: const Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
      
    );
  }
}
