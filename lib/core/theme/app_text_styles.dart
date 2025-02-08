import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_sizes.dart';

abstract class AppTextStyles {
  static TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    // Headline
    headlineLarge: const TextStyle().copyWith(
      fontSize: AppSizes.xxl,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),

    headlineMedium: const TextStyle().copyWith(
      fontSize: AppSizes.xxl,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),

    // Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: AppSizes.md,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    bodyMedium: const TextStyle().copyWith(
      fontSize: AppSizes.sm,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    bodySmall: const TextStyle().copyWith(
      fontSize: AppSizes.xs,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
  );
}
