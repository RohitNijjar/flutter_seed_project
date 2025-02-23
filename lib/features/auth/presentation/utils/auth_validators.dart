final class AuthValidators {
  AuthValidators._();

  static String? isEmailValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    }

    const emailRegex =
        r'^[a-zA-Z0-9_!#$%&*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+(\.[a-zA-Z]{2,})$';
    if (!RegExp(emailRegex).hasMatch(value.trim())) {
      return 'Enter a valid email address.';
    }

    return null;
  }

  static String? isPasswordValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required.';
    }

    if (value.trim().length < 8) {
      return 'Password must be at least 8 characters.';
    }

    const passwordRegex =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,}$';
    if (!RegExp(passwordRegex).hasMatch(value.trim())) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.';
    }

    return null;
  }
}
