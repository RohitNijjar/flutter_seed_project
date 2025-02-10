import '../values/constants/app_error.dart';
import '../values/constants/app_error_codes.dart';

abstract class ApiMessageResolver {
  static String resolveMessage(String errorCode) {
    switch (errorCode) {
      case AppErrorCodes.unauthorized:
      case AppErrorCodes.refreshTokenExpired:
        return AppError.authError;
      case AppErrorCodes.internalServerError:
        return AppError.serverError;
      case AppErrorCodes.invalidRequest:
        return AppError.invalidInputError;
      default:
        return AppError.unexpectedError;
    }
  }
}
