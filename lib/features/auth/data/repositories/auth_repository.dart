import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/logger.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/interfaces/iauth_repository.dart';
import '../datasources/api/auth_api.dart';
import '../dtos/login_request.dart';
import '../dtos/register_request.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  @override
  Future<Either<Failure, User>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await _authApi.login(loginRequest);
      logger.i(response);
      return right(response.data!.toEntity());
    } catch (e) {
      logger.e(e);
      return left(const Failure('Testing error'));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      final response = await _authApi.register(registerRequest);
      logger.i(response);
      return right(response.data!.toEntity());
    } catch (e) {
      logger.e(e);
      return left(const Failure('Testing error'));
    }
  }
}
