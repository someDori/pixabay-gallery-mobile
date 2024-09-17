import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/constants/enums.dart';
import 'package:pixabay_gallery_mobile/constants/validator_helper.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/form/login_form_field.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/button/primary_button.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/form/number_input_field.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController ageController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onLoginPressed;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.ageController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.onLoginPressed,
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
            validator: (value) {
              String? emptyError =
                  ValidatorHelper.validateFormField(value, 'Enter age');
              if (emptyError != null) {
                return emptyError;
              }

              String? invalidAgeError =
                  ValidatorHelper.validateAge(value, min: 18, max: 99);
              if (invalidAgeError != null) {
                return invalidAgeError;
              }

              return null;
            },
          ),
          const SizedBox(
            height: AppSpacing.eight,
          ),
          LoginFormField(
            controller: widget.emailController,
            label: 'Email',
            validator: (value) {
              String? emptyError =
                  ValidatorHelper.validateFormField(value, 'Enter an email');
              if (emptyError != null) {
                return emptyError;
              }

              String? invalidDataError = ValidatorHelper.validateEmail(
                  value, 'Please enter a valid email address');
              if (invalidDataError != null) {
                return invalidDataError;
              }

              return null;
            },
          ),
          const SizedBox(
            height: AppSpacing.eight,
          ),
          LoginFormField(
            controller: widget.passwordController,
            label: 'Password',
            obscureText: _obscurePassword,
            validator: (value) {
              String? emptyError =
                  ValidatorHelper.validateFormField(value, 'Enter a password');
              if (emptyError != null) {
                return emptyError;
              }

              String? invalidPasswordError =
                  ValidatorHelper.validatePasswordLength(
                value,
              );
              if (invalidPasswordError != null) {
                return invalidPasswordError;
              }

              String? passwordsDoNotMatchError =
                  ValidatorHelper.validatePasswordsMatch(
                value,
                widget.confirmPasswordController.text,
              );
              if (passwordsDoNotMatchError != null) {
                return passwordsDoNotMatchError;
              }

              return null;
            },
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
            validator: (value) {
              String? emptyError =
                  ValidatorHelper.validateFormField(value, 'Enter a password');
              if (emptyError != null) {
                return emptyError;
              }

              String? invalidPasswordError =
                  ValidatorHelper.validatePasswordLength(
                value,
              );
              if (invalidPasswordError != null) {
                return invalidPasswordError;
              }

              String? passwordsDoNotMatchError =
                  ValidatorHelper.validatePasswordsMatch(
                value,
                widget.passwordController.text,
              );
              if (passwordsDoNotMatchError != null) {
                return passwordsDoNotMatchError;
              }

              return null;
            },
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
              height: AppSpacing.forty,
              width: double.infinity,
              onPressed: widget.onLoginPressed,
              buttonType: ButtonType.primary,
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
