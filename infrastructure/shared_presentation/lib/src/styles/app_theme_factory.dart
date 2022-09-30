import 'package:flutter/material.dart';
import '../../shared_presentation.dart';

class AppThemeFactory {
  ThemeData getAppThemeData() {
    return _lightTheme;
  }

  ThemeData get _lightTheme => ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColors.primaryLight,
    brightness: Brightness.light,
    backgroundColor: AppColors.backgroundLight,
    dividerColor: AppColors.dividerColor,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: AppFonts.size12,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        height: 1.0,
      ),
      titleMedium: TextStyle(
        fontSize: AppFonts.size16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.0,
      ),
      titleLarge: TextStyle(
        fontSize: AppFonts.size28,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 1.0,
      ),
      bodySmall: TextStyle(
        fontSize: AppFonts.size14,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade900,
        height: 1.0,
      ),
      bodyMedium: TextStyle(
        fontSize: AppFonts.size14,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade900,
        height: 1.0,
      ),
      bodyLarge: TextStyle(
        fontSize: AppFonts.size18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.0,
      ),
    ),
    colorScheme:  const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.primaryLight,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondary,
      error: Colors.red,
      onError: Colors.red,
      background: AppColors.backgroundLight,
      onBackground: AppColors.backgroundLight,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
  );
}