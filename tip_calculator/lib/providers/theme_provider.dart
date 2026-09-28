import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  // getters
  bool get isDarkMode => _isDarkMode;

  // Method to toggle between light and dark modes
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
