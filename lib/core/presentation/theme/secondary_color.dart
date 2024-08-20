import 'package:flutter/material.dart';

class SecondaryColor{
  static const MaterialColor color = MaterialColor(_secondaryPrimaryValue, <int, Color>{
    50: Color(0xFFFFF1E0),
    100: Color(0xFFFFDBB3),
    200: Color(0xFFFFC480),
    300: Color(0xFFFFAC4D),
    400: Color(0xFFFF9A26),
    500: Color(_secondaryPrimaryValue),
    600: Color(0xFFFF8000),
    700: Color(0xFFFF7500),
    800: Color(0xFFFF6B00),
    900: Color(0xFFFF5800),
  });
  static const int _secondaryPrimaryValue = 0xFFFF8800;

  static const MaterialColor secondaryAccent = MaterialColor(_secondaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_secondaryAccentValue),
    400: Color(0xFFFFD1BF),
    700: Color(0xFFFFBFA6),
  });
  static const int _secondaryAccentValue = 0xFFFFF6F2;
}