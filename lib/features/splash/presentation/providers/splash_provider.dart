import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/injectable/injectable.dart';
import '../../../../core/config/logger.dart';
import '../../../../core/constants/route_paths.dart';
import '../states/splash_state.dart';

@injectable
class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState.initial()) {
    logger.d('SplashNotifier created');
    _init();
  }

  Future<void> _init() async {
    logger.d('Starting initialization');
    state = const SplashState.loading();
    await Future.delayed(const Duration(seconds: 2));
    logger.d('Initialization complete');
    state = const SplashState.success(RoutePaths.login);
  }
}

final splashProvider =
    StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return getIt<SplashNotifier>();
});
