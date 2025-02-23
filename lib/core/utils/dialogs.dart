import 'package:flutter/material.dart';

final class Dialogs {
  const Dialogs._();

  static void showSnackBar(BuildContext context,
      {required String message, bool isFloating = true}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          behavior:
              isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
          width: isFloating ? 320 : null,
        ),
      );
  }
}
