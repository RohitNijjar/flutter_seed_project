import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/logger.dart';
import '../../../../core/values/constants/route_paths.dart';
import '../providers/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashProvider, (_, state) {
      state.maybeWhen(
        success: (route) {
          logger.d('SplashScreen: $route');
          context.go(route);
        },
        error: (error) => context.go(RoutePaths.error, extra: error),
        orElse: () {
          logger.d('SplashScreen: $state');
        },
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/app_logo.png'),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
