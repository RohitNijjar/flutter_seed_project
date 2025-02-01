import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(AppTheme.lightTheme);

  void toggleTheme() {
    state =
        state == AppTheme.lightTheme ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}
