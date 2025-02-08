import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_spacing.dart';

abstract class AppTextInputTheme {
  static InputDecorationTheme lightInputDecoration =
      const InputDecorationTheme().copyWith(
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.sm,
      color: AppColors.grey2.withAlpha(204),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.grey4,
      ),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadiusSm),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.grey4,
      ),
      borderRadius: BorderRadius.circular(AppSpacing.borderRadiusSm),
    ),
    contentPadding: const EdgeInsets.all(AppSpacing.sm),
  );
}
