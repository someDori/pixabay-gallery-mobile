import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/constants/enums.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/form/login_form_field.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/button/primary_button.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_cubit.dart';
import 'package:pixabay_gallery_mobile/constants/validator_helper.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.emailController,
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
            controller: widget.emailController,
            label: 'Email',
            validator: (value) {
              String? emptyError = ValidatorHelper.validateEmptyFormField(
                  value, 'Enter an email');
              if (emptyError != null) {
                context.read<LoginCubit>().emitEmptyLoginError();
                return emptyError;
              }

              String? invalidDataError = ValidatorHelper.validateInvalidEmail(
                  value, 'Please enter a valid email address');
              if (invalidDataError != null) {
                context.read<LoginCubit>().emitInvalidLoginError();
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
              String? emptyError = ValidatorHelper.validateEmptyFormField(
                  value, 'Enter a password');
              if (emptyError != null) {
                context.read<LoginCubit>().emitEmptyLoginError();
                return emptyError;
              }

              String? invalidPasswordError =
                  ValidatorHelper.validateInvalidPasswordLength(
                value,
              );
              if (invalidPasswordError != null) {
                context.read<LoginCubit>().emitInvalidLoginError();
                return invalidPasswordError;
              }

              return null;
            },
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: Text(
                _obscurePassword ? 'Show' : 'Hide',
                style: passwordToggleTextStyle,
              ),
            ),
          ),
          Padding(
            padding: AppSpacing.twentyVertical,
            child: PrimaryButton(
              title: 'log in',
              disabled: false,
              height: 40,
              width: double.infinity,
              onPressed: _login,
              buttonType: ButtonType.primary,
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'First time? ',
                    style: firstTimeTextStyle,
                  ),
                  TextSpan(
                    text: 'Register now',
                    style: firstTimeTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(registerScreenRoute);
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

  Future<void> _login() async {
    // try {
    //   final images = await PixabayHelper.getImages(
    //     token: ApiKeys.pixabayApiKey,
    //     messageBody: {'image_type': 'photo'},
    //   );
    //   if (images != null) {
    //     for (var i = 0; i < images.hits!.length; i++) {
    //       print("i: ${images.hits![i].user_id}");
    //     }
    //     print(images.hits?.length);
    //     print('Images data: $images');
    //   } else {
    //     print('Failed to fetch images.');
    //   }
    // } catch (e) {
    //   print('Error: $e');
    // }

    if (!(widget.formKey.currentState?.validate() ?? false)) {
      return;
    }
    // await BlocProvider.of<AuthenticationCubit>(context).authenticateUser();
    Navigator.of(context).pushNamed(homeScreenRoute);
  }
}
