import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/dtos/login_request.dart';
import '../entities/user.dart';
import '../interfaces/iauth_repository.dart';

@injectable
class LoginUseCase implements UseCase<User, LoginRequest> {
  final IAuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(LoginRequest params) async =>
      await _authRepository.login(loginRequest: params);
}
