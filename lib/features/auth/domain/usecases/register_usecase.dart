import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/dtos/register_request.dart';
import '../entities/user.dart';
import '../interfaces/iauth_repository.dart';

@injectable
class RegisterUseCase implements UseCase<User, RegisterRequest> {
  final IAuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(RegisterRequest params) async =>
      await _authRepository.register(registerRequest: params);
}
