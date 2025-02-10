abstract class AuthError {
  static const invalidCredentials = 'Email or password is incorrect';

  static const alreadyExists = 'Email is already taken';

  static const userNotFound =
      'There is no account associated with your email. Please register';

  static const userNotVerified =
      'You are not authorized to access this. Please verify your email.';
}
