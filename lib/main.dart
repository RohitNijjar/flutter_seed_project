import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/error_handler.dart';
import 'core/config/injectable/injectable.dart';
import 'core/config/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  logger;

  initializeErrorHandler();

  runApp(const ProviderScope(child: MyApp()));
}
