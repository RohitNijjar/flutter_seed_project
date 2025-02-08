import 'package:flutter/material.dart';
import 'app_button_styles.dart';
import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_spacing.dart';
import 'app_text_input_theme.dart';
import 'app_text_styles.dart';

final class AppTheme {
  const AppTheme._();

  static const _lightColorScheme = ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      error: AppColors.error,
      surface: AppColors.scaffoldBackground,
      onSurface: AppColors.onSurface);

  static const _darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryLight,
    surface: AppColors.black,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: AppTextStyles.lightTextTheme,
    iconTheme: const IconThemeData().copyWith(
      color: AppColors.grey1,
      size: AppSizes.xl,
    ),
    elevatedButtonTheme: AppButtonStyles.lightElevetedButtonTheme,
    inputDecorationTheme: AppTextInputTheme.lightInputDecoration,
    extensions: <ThemeExtension<dynamic>>[
      const AppThemeExtension(
        successColor: AppColors.success,
        errorColor: AppColors.error,
        grey1: AppColors.grey1,
        grey2: AppColors.grey2,
        grey3: AppColors.grey3,
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
        grey1: AppColors.grey1,
        grey2: AppColors.grey2,
        grey3: AppColors.grey3,
        spacing: AppSpacing.md,
      )
    ],
  );
}

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color successColor;
  final Color errorColor;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final double spacing;

  const AppThemeExtension({
    required this.successColor,
    required this.errorColor,
    required this.grey1,
    required this.grey2,
    required this.grey3,
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
