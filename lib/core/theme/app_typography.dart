import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextTheme get textTheme {
    return GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.outfit(fontSize: 57, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.outfit(fontSize: 45, fontWeight: FontWeight.bold),
      displaySmall: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.bold),
      headlineLarge: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.w600),
      headlineMedium: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w600),
      headlineSmall: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      labelMedium: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
    );
  }
}
