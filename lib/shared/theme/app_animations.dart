import 'package:flutter/material.dart';

/// Centralized animation durations and curves.
class AppAnimations {
  AppAnimations._();

  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationMedium = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);

  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveBouncy = Curves.easeOutBack;
}
