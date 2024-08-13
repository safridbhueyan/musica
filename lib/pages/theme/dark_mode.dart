import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900, // Replaced background with surface
    primary: Colors.grey.shade600,
    secondary: const Color.fromARGB(255, 51, 51, 51),
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade300,
  ),
);
