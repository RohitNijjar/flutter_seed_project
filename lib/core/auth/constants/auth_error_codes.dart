abstract class AuthErrorCodes {
  static const String existingUserError = 'ERR_AUTH_USER_ALREADY_EXISTS';
  static const String invalidCredentials = 'ERR_AUTH_INVALID_CREDENTIALS';
  static const String userNotFound = 'ERR_AUTH_USER_NOT_FOUND';
  static const String userAlreadyVerified = 'ERR_AUTH_USER_ALREADY_VERIFIED';
  static const String userNotVerified = 'ERR_AUTH_USER_NOT_VERIFIED';
  static const String invalidProvider = 'ERR_AUTH_INVALID_PROVIDER';
  static const String invalidAccessToken = 'ERR_AUTH_INVALID_ID_TOKEN';
  static const String missingCodeOrProvider =
      'ERR_AUTH_MISSING_CODE_OR_PROVIDER';
}
