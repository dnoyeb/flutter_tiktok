import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  MaterialColor themeData = Colors.red;

  MaterialColor getTheme() => themeData;
  num test = 123;
  void setTheme(MaterialColor color) {
    test++;
    print(test);
    themeData = color;
    notifyListeners();
  }
}
