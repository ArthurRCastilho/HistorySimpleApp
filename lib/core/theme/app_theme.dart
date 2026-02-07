import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor, primary: AppColors.primaryColor, secondary: AppColors.secondaryColor, surface: Colors.white),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF3A2A1A)),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF3A2A1A)),
      bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF6D4C3D)),
      bodySmall: TextStyle(fontSize: 14, color: Color(0xFF8D6E63)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Color(0xFFBCAAA4)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}
