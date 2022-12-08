import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setcolor(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
