import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/forms/login_form_field.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/buttons/primary_button.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/forms/number_input_field.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController ageController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.ageController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AgeFormField(
            controller: widget.ageController,
            label: 'Age',
          ),
          const SizedBox(
            height: AppSpacing.eight,
          ),
          LoginFormField(
            controller: widget.emailController,
            label: 'Email',
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
          const SizedBox(
            height: AppSpacing.eight,
          ),
          LoginFormField(
            controller: widget.confirmPasswordController,
            label: 'Confirm Password',
            obscureText: _obscureConfirmPassword,
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
              child: Text(_obscureConfirmPassword ? 'Show' : 'Hide'),
            ),
          ),
          Padding(
            padding: AppSpacing.twentyVertical,
            child: PrimaryButton(
              title: 'register',
              disabled: false,
              height: AppSpacing.fourty,
              width: double.infinity,
              onPressed: () {},
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: firstTimeTextStyle,
                  ),
                  TextSpan(
                    text: 'Log in now',
                    style: firstTimeTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(loginScreenRoute);
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
