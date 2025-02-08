import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/data/dtos/login_request.dart';
import '../../../features/auth/data/dtos/register_request.dart';
import '../../../features/auth/domain/usecases/login_usecase.dart';
import '../../../features/auth/domain/usecases/register_usecase.dart';
import '../states/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthNotifier(
    this._loginUseCase,
    this._registerUseCase,
  ) : super(const AuthState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    final result =
        await _loginUseCase(LoginRequest(email: email, password: password));

    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    final result = await _registerUseCase(RegisterRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    ));

    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (user) => state = AuthState.authenticated(user),
    );
  }
}
