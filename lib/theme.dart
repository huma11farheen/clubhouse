import 'package:flutter/material.dart';

class Palette {
  static const Color lightGreen = Color(0xFF4db579);
  static const Color lightCream = Color(0xFFf3f2e3);
  static const Color darkGreen = Color(0xFF265d3e);
  static const Color grey = Color(0xFF7d7a7);
  static const Color darkCream = Color(0xFFc4c4b4);
  static const Color greyGreen = Color(0xFF44443c);
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  final colorScheme = base.colorScheme.copyWith(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Palette.darkCream,
    onSecondary: Colors.white,
  );
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    colorScheme: colorScheme,
    cardColor: Palette.lightCream,
    backgroundColor: Colors.white,
    canvasColor: Colors.white,

  );
}
