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
      bodySmall: TextStyle(
        fontSize: AppFonts.size14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondaryBody,
        height: 1.0,
      ),
      bodyMedium: TextStyle(
        fontSize: AppFonts.size14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 1.2,
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