import '../../utils/api_message_resolver.dart';
import '../../values/constants/app_error.dart';
import '../constants/auth_error.dart';
import '../constants/auth_error_codes.dart';

abstract class AuthMessageResolver {
  static String resolveMessage(String errorCode) {
    switch (errorCode) {
      case AuthErrorCodes.invalidCredentials:
        return AuthError.invalidCredentials;
      case AuthErrorCodes.existingUserError:
        return AuthError.alreadyExists;
      case AuthErrorCodes.userNotFound:
        return AuthError.userNotFound;
      case AuthErrorCodes.userNotVerified:
        return AuthError.userNotVerified;
      case AuthErrorCodes.userAlreadyVerified:
      case AuthErrorCodes.invalidAccessToken:
      case AuthErrorCodes.invalidProvider:
      case AuthErrorCodes.missingCodeOrProvider:
        return AppError.serverError;
      default:
        return ApiMessageResolver.resolveMessage(errorCode);
    }
  }
}
