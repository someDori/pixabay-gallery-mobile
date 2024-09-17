import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_cubit.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_state.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/form/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
              return const Center(
                child: CircularProgressIndicator(),
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
                          "Hello",
                          style: headerTextStyle,
                        ),
                        const SizedBox(
                          height: AppSpacing.sixteen,
                        ),
                        LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                          formKey: _formKey,
                          onLoginPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<AuthenticationCubit>().login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
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
