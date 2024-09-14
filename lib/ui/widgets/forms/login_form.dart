import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/forms/login_form_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController usernameController;

  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          LoginFormField(
            controller: widget.usernameController,
            label: 'Username',
          ),
          const SizedBox(
            height: AppSpacing.eight,
          ),
          LoginFormField(
            controller: widget.passwordController,
            label: 'Password',
            obscureText: _obscurePassword,
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: Text(_obscurePassword ? 'Show' : 'Hide'),
            ),
          ),
        ],
      ),
    );
  }
}
