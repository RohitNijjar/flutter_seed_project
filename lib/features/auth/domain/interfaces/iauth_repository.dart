import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../data/dtos/login_request.dart';
import '../../data/dtos/register_request.dart';
import '../entities/user.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, User>> register({
    required RegisterRequest registerRequest,
  });

  Future<Either<Failure, User>> login({
    required LoginRequest loginRequest,
  });
}
