import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title:
            Text('Register', style: Theme.of(context).textTheme.displayMedium),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          width: double.infinity,
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
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
                CustomTextFormInput(
                  controller: emailController,
                  hintText: 'Email Id',
                  iconStart: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                CustomTextFormInput(
                  controller: passwordController,
                  hintText: 'Password',
                  iconStart: Icons.lock,
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 150),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
