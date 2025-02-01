import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    // Headline
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),

    // Body
    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    bodySmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
  );
}
