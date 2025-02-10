import '../values/constants/app_error.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({String message = AppError.serverError}) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = AppError.networkError})
      : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure({String message = AppError.authError}) : super(message);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({String message = AppError.invalidInputError})
      : super(message);
}
