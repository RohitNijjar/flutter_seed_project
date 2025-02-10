import 'package:dio/dio.dart';

import '../config/logger.dart';
import '../values/constants/app_error_codes.dart';
import '../values/enums/http_status.dart';
import '../errors/failures.dart';

abstract class ApiErrorHandler {
  static Failure handleDioError(
    DioException e,
    String Function(String) messageResolver,
  ) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkFailure();
      default:
        return _handleHttpException(e, messageResolver);
    }
  }

  static Failure _handleHttpException(
    DioException e,
    String Function(String) messageResolver,
  ) {
    if (e.response != null &&
        e.response?.data != null &&
        e.response?.data is Map) {
      final Map<String, dynamic> responseData = e.response!.data;
      final errorCode = responseData['errorCode'] ?? AppErrorCodes.unexpected;
      final statusCode = responseData['statusCode'];
      final serverMessage = responseData['message'];
      final message = messageResolver(errorCode);

      logger.e(
        'API Error -> Code: $errorCode, Status: $statusCode, Server: $serverMessage, Message: $message',
      );

      if (statusCode == HttpStatus.badRequest.code) {
        return InvalidInputFailure(message: message);
      } else if (statusCode == HttpStatus.unauthorized.code ||
          statusCode == HttpStatus.forbidden.code) {
        return AuthFailure(message: message);
      }
      return ServerFailure(message: message);
    }

    return const ServerFailure();
  }
}
