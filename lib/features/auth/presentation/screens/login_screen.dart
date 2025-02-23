import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/auth/provider/auth_provider.dart';
import '../../../../core/utils/dialogs.dart';
import '../../../../core/values/constants/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/text_form_input/custom_text_form_input.dart';
import '../utils/auth_validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      ref.read(authProvider.notifier).login(
            email: emailController.text,
            password: passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (user) {
          Dialogs.showSnackBar(
            context,
            message: 'Welcome back, ${user.email}!',
          );
          // context.go(RoutePaths.home);
        },
        error: (error) {
          Dialogs.showSnackBar(context, message: error);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xl,
            ),
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    'assets/images/sign_in.svg',
                    width: 280,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.primaryDark,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  CustomTextFormInput(
                    controller: emailController,
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                    iconStart: Icons.email,
                    validator: AuthValidators.isEmailValid,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  CustomTextFormInput(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    inputType: TextInputType.visiblePassword,
                    iconStart: Icons.lock,
                    validator: AuthValidators.isPasswordValid,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: AppColors.scaffoldBackground,
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryLight,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  ElevatedButton(
                    onPressed: authState.maybeWhen(orElse: () => _login),
                    child: authState.maybeWhen(
                      loading: () => const CircularProgressIndicator.adaptive(),
                      orElse: () => const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .extension<AppThemeExtension>()!
                              .grey2,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 50),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'New to the App? ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.primaryDark,
                          ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.primaryLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => authState.maybeWhen(
                                  orElse: () => context.go(RoutePaths.register),
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
