import 'package:flutter/material.dart';

class ColorResources {
  ColorResources._();

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color themeColor = Color(0xFF1C2341);
  static const Color secondaryColor = Color(0xFF8B94BC);
  static const Color green = Color(0xFF6AC259);
  static const Color lightBlue = Color(0xFF3F4768);
  static const Color red = Color(0xFFE92E30);
  static const Color grey = Color(0xFFC1C1C1);
  static const primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF46A0AE),
      Color(0xFF00FFCB),
    ],
  );
}
