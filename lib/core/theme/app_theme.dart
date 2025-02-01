import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

final class AppTheme {
  const AppTheme._();

  static const _lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    surface: AppColors.scaffoldBackground,
  );

  static const _darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryLight,
    surface: AppColors.black,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    extensions: <ThemeExtension<dynamic>>[
      const AppThemeExtension(
        successColor: AppColors.success,
        errorColor: AppColors.error,
        grey: AppColors.grey,
        spacing: AppSpacing.md,
      )
    ],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    extensions: <ThemeExtension<dynamic>>[
      const AppThemeExtension(
        successColor: AppColors.success,
        errorColor: AppColors.error,
        grey: AppColors.grey,
        spacing: AppSpacing.md,
      )
    ],
  );
}

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color successColor;
  final Color errorColor;
  final Color grey;
  final double spacing;

  const AppThemeExtension({
    required this.successColor,
    required this.errorColor,
    required this.grey,
    required this.spacing,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith() => this;

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t,
  ) =>
      this;
}
