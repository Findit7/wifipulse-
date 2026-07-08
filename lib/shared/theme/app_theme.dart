import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_radius.dart';

/// Centralized Material 3 Theme definitions.
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.lightSurface,
        error: AppColors.danger,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textLightPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textLightPrimary,
        displayColor: AppColors.textLightPrimary,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.lightSurface,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.roundedLg),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkSurface,
        error: AppColors.danger,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textDarkPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textDarkPrimary,
        displayColor: AppColors.textDarkPrimary,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.darkSurface,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.roundedLg),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0,
        ),
      ),
    );
  }
}
