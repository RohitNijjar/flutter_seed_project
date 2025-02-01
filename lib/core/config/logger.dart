import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger? _logger;

Logger get logger => _logger ??= _initializeLogger();

Logger _initializeLogger() {
  final logger = Logger(
    filter: ProductionFilter(),
    printer: PrettyPrinter(
      errorMethodCount: 5,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    output: ConsoleOutput(),
  );

  if (kReleaseMode) {
    Logger.level = Level.info;
  } else {
    Logger.level = Level.debug;
  }

  return logger;
}
