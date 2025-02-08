import '../values/constants/app_error.dart';

class Failure {
  const Failure([this.message = AppError.generalError]);

  final String message;
}
