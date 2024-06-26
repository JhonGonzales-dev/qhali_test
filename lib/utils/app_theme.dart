import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(elevation: 0.0),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: Colors.deepPurple[50]!.withOpacity(0.5),
        errorStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
        ),
        contentPadding: const EdgeInsets.all(12),
        helperStyle: const TextStyle(fontSize: 13),
        labelStyle: const TextStyle(
          height: 0.9,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
