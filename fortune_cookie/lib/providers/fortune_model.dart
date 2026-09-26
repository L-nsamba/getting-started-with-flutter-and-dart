import 'dart:math';

import 'package:flutter/widgets.dart';

class FortuneModel extends ChangeNotifier {
  String _currentFortune = "";

  final _fortuneList = [
    "I will find a new friend tomorrow",
    "I will get rich",
    "Adventure can be real happiness",
    "Happiness is the truth",
    "Good health",
  ];

  String get currentFortune => _currentFortune;

  FortuneModel() {
    _generateRandomFortune();
  }

  void _generateRandomFortune() {
    var random = Random();
    int randNum = random.nextInt(_fortuneList.length);

    _currentFortune = _fortuneList[randNum];

    notifyListeners();
  }

  // Method to a get a new random fortune
  void getNewFortune() {
    _generateRandomFortune();
  }
}
