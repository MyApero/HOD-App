import 'package:flutter/material.dart';
import 'package:hod/theme/palette.dart';

ThemeData theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Palette.darkPurple,
    primary: Palette.purple,
    onPrimary: Palette.lightPurple,
    secondary: Palette.lightBlue,
    tertiary: Palette.white,
    // onSurfaceVariant: const Color,
    // secondaryContainer: const Color(0xFFe3e3f1),
    secondaryContainer: Palette.softPurple,
    surfaceVariant: Palette.whitePurple,
    // secondaryContainer: const Color(0xFFaeaed7),
  ),
);
