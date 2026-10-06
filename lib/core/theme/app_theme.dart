import 'package:flutter/material.dart';

class AppTheme {
  static const Color seedColor = Color(0xFF00696E);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
    );
  }
}
