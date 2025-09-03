import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';

class ThemeApp {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.black,
      elevation: 0,
    ),
    textTheme: const TextTheme(
     headlineSmall: TextStyle(
        color: ColorsApp.gold,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: ColorsApp.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: ColorsApp.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: ColorsApp.white,
        fontSize: 12,
      ),
    ),
  );
  
}