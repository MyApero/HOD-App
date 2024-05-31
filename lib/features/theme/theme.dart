import 'package:flutter/material.dart';

ThemeData theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF4A148C),
    primary: const Color(0xFF6520BA),
    onPrimary: const Color(0xFFCCCCF5),
    secondary: const Color(0xFF8f8fff),
    tertiary: const Color(0xFFFFFFFF),
    // onSurfaceVariant: const Color,
    // secondaryContainer: const Color(0xFFe3e3f1),
    secondaryContainer: const Color(0xFFd9d9fc),
    surfaceVariant: const Color(0xFFe3e3f1),
    // secondaryContainer: const Color(0xFFaeaed7),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 47,
      color: Colors.black,
      fontFamily: "CoolveticaCompressedHv",
    ),
  ),
);
