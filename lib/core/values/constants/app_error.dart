abstract class AppError {
  static const unexpectedError = 'Unexpected error occured.';

  static const serverError = 'Something went wrong, please try again later.';

  static const networkError =
      'Could not connect at the moment, please try again later.';

  static const authError = 'You are not authenticated, please try logging in.';

  static const invalidInputError =
      'Please provide the complete and valid info.';
}
