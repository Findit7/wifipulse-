import 'package:flutter/material.dart';

/// Centralized border radius definitions (Squircle styling).
class AppRadius {
  AppRadius._();

  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  static const BorderRadius roundedSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius roundedMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius roundedLg = BorderRadius.all(Radius.circular(lg)); // Default for Cards
  static const BorderRadius roundedXl = BorderRadius.all(Radius.circular(xl));
  
  static const BorderRadius pill = BorderRadius.all(Radius.circular(9999.0)); // Pill buttons
}
