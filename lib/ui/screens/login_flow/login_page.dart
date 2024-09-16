import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_cubit.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_state.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/form/login_form.dart';
import 'package:pixabay_gallery_mobile/ui/widgets/loading_indicator.dart';

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
