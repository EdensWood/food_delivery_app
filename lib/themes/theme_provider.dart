import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = MyAppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == MyAppTheme.darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == MyAppTheme.lightTheme) {
      themeData = MyAppTheme.darkTheme;
    } else {
      themeData = MyAppTheme.lightTheme;
    }
  }

}