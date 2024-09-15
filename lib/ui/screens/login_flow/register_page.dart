import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_cubit.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_state.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/forms/register_form.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/loading_indicator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, loginState) {
            if (loginState is LoginLoading) {
              return const LoadingIndicator();
            }

            if (loginState is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Something went wrong"),
                ),
              );
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: AppSpacing.sixteenHorizontal,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          "Let's create an account",
                          style: headerTextStyle,
                        ),
                        const SizedBox(
                          height: AppSpacing.sixteen,
                        ),
                        RegisterForm(
                          ageController: _ageController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                          formKey: _formKey,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
