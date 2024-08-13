import 'package:flutter/material.dart';
import 'package:musica/pages/theme/dark_mode.dart';
import 'package:musica/pages/theme/light_mode.dart';

class Themeprovider extends ChangeNotifier {
//inital lets keep t light mode

  ThemeData _themeData = lightMode;

// getter of theme

  ThemeData get themeData => _themeData;

  // is dark mode or not

  bool get isDarkMode => _themeData == darkMode;

  // set theme

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //update the UI
    notifyListeners();
  }

  //toggle theme methods
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
