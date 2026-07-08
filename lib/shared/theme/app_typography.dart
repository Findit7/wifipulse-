import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized scalable typography system.
class AppTypography {
  AppTypography._();

  static const _baseFont = GoogleFonts.inter;

  static TextTheme get textTheme => TextTheme(
        displayLarge: _baseFont(fontSize: 57, fontWeight: FontWeight.bold, letterSpacing: -0.25),
        displayMedium: _baseFont(fontSize: 45, fontWeight: FontWeight.bold, letterSpacing: 0),
        displaySmall: _baseFont(fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 0),
        
        headlineLarge: _baseFont(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0),
        headlineMedium: _baseFont(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0),
        headlineSmall: _baseFont(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0),
        
        titleLarge: _baseFont(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0),
        titleMedium: _baseFont(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15),
        titleSmall: _baseFont(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1),
        
        bodyLarge: _baseFont(fontSize: 16, fontWeight: FontWeight.normal, letterSpacing: 0.5),
        bodyMedium: _baseFont(fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 0.25),
        bodySmall: _baseFont(fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0.4),
        
        labelLarge: _baseFont(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        labelMedium: _baseFont(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
        labelSmall: _baseFont(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      );
}
