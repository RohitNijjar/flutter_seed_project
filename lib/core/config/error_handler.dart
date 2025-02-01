import 'package:flutter/foundation.dart';

import 'logger.dart';

void initializeErrorHandler() {
  FlutterError.onError = (details) {
    logger.e('Flutter error',
        error: details.exception, stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('Uncaught error', error: error, stackTrace: stack);
    return true;
  };
}
