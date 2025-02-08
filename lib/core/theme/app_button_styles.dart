import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_spacing.dart';

abstract class AppButtonStyles {
  static ElevatedButtonThemeData lightElevetedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.borderRadiusSm),
      ),
      textStyle: const TextStyle(
        fontSize: AppSizes.md,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  );
}
