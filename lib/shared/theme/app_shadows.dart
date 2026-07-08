import 'package:flutter/material.dart';

/// Centralized shadow system for depth.
class AppShadows {
  AppShadows._();

  static const List<BoxShadow> lightSm = [
    BoxShadow(color: Color(0x0C000000), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const List<BoxShadow> lightMd = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -1),
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 2), blurRadius: 4, spreadRadius: -1),
  ];

  static const List<BoxShadow> lightLg = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 10), blurRadius: 15, spreadRadius: -3),
    BoxShadow(color: Color(0x0A000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -2),
  ];

  static const List<BoxShadow> darkSm = [
    BoxShadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const List<BoxShadow> darkMd = [
    BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -1),
  ];
}
