import 'package:flutter/material.dart';

/// Centralized color system for WiFiPulse supporting light and dark modes.
class AppColors {
  AppColors._();

  // Core Brand Colors
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  static const Color secondary = Color(0xFF14B8A6);
  static const Color secondaryLight = Color(0xFF2DD4BF);
  static const Color secondaryDark = Color(0xFF0D9488);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Network Status Colors
  static const Color networkExcellent = Color(0xFF10B981); // Green
  static const Color networkGood = Color(0xFF3B82F6); // Blue
  static const Color networkFair = Color(0xFFF59E0B); // Yellow/Orange
  static const Color networkPoor = Color(0xFFEF4444); // Red
  static const Color networkOffline = Color(0xFF6B7280); // Gray

  // Security Score Colors
  static const Color securityHigh = Color(0xFF10B981);
  static const Color securityMedium = Color(0xFFF59E0B);
  static const Color securityLow = Color(0xFFEF4444);

  // Dark Mode Surface & Backgrounds
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkSurfaceHighlight = Color(0xFF334155);

  // Light Mode Surface & Backgrounds
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceHighlight = Color(0xFFE2E8F0);

  // Text Colors
  static const Color textDarkPrimary = Color(0xFFF8FAFC);
  static const Color textDarkSecondary = Color(0xFF94A3B8);

  static const Color textLightPrimary = Color(0xFF0F172A);
  static const Color textLightSecondary = Color(0xFF64748B);
}
