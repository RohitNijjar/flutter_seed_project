import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/auth/provider/auth_provider.dart';
import '../../../../core/values/constants/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/text_form_input/custom_text_form_input.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void _register() {
    ref.read(authProvider.notifier).register(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RoutePaths.login),
        ),
        title: Text(
          'Register',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.primaryDark,
              ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomTextFormInput(
                        controller: firstNameController,
                        hintText: 'First Name',
                        iconStart: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      CustomTextFormInput(
                        controller: lastNameController,
                        hintText: 'Last Name',
                        iconStart: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      CustomTextFormInput(
                        controller: emailController,
                        hintText: 'Email Id',
                        iconStart: Icons.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      CustomTextFormInput(
                        controller: passwordController,
                        hintText: 'Password',
                        iconStart: Icons.lock,
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.lg,
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: authState.maybeWhen(
                orElse: () => _register,
              ),
              child: authState.maybeWhen(
                loading: () => const CircularProgressIndicator.adaptive(),
                orElse: () => const Text('Register'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
