import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_cubit.dart';
import 'package:pixabay_gallery_mobile/cubits/authentication_cubits/authentication_state.dart';
import 'package:pixabay_gallery_mobile/ui/screens/something_went_wrong_page/semething_went_wrong_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        context.read<AuthenticationCubit>().checkAuthStatus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.of(context).pushReplacementNamed(homeScreenRoute);
        } else if (state is AuthenticationUnauthenticated) {
          Navigator.of(context).pushReplacementNamed(loginScreenRoute);
        } else if (state is AuthenticationError) {
          Navigator.of(context).pushReplacementNamed(
            somethingWentWrongScreenRoute,
            arguments: state.error,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/pixabay_logo.svg',
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              const SizedBox(height: AppSpacing.sixteen),
              const Text('Pixabay on mobile'),
            ],
          ),
        ),
      ),
    );
  }
}
