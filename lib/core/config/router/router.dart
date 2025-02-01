import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/register_screen.dart';
import '../../../features/splash/presentation/screens/splash_screen.dart';
import '../../constants/route_paths.dart';
import '../../screens/error_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      name: 'splash',
      path: RoutePaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'error',
      path: RoutePaths.error,
      builder: (context, state) {
        final message = state.extra as String? ?? 'An error occurred';
        return ErrorScreen(error: message);
      },
    ),
    GoRoute(
      name: 'login',
      path: RoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'register',
      path: RoutePaths.register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
