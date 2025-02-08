import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/domain/usecases/login_usecase.dart';
import '../../../features/auth/domain/usecases/register_usecase.dart';
import '../../config/injectable/injectable.dart';
import '../states/auth_state.dart';
import 'auth_notifier.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    getIt<LoginUseCase>(),
    getIt<RegisterUseCase>(),
  );
});
