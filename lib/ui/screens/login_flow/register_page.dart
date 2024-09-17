import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_cubit.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_state.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/form/register_form.dart';
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
        body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationAuthenticated) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              Navigator.of(context).pushReplacementNamed(homeScreenRoute);
            } else if (state is AuthenticationError) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return const LoadingIndicator();
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
                          onLoginPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<AuthenticationCubit>().register(
                                    _emailController.text,
                                    _passwordController.text,
                                    int.parse(_ageController.text),
                                  );
                              return;
                            }
                          },
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
