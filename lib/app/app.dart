import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_gallery_mobile/constants/routes.dart';
import 'package:pixabay_gallery_mobile/cubits/images_cubits/images_cubit.dart';
import 'package:pixabay_gallery_mobile/ui/screens/home_page/home_page.dart';
import 'package:pixabay_gallery_mobile/ui/screens/login_flow/login_page.dart';
import 'package:pixabay_gallery_mobile/ui/screens/profile_page/profile_page.dart';
import 'package:pixabay_gallery_mobile/ui/screens/splash_page/splash_screen.dart';
import 'package:pixabay_gallery_mobile/cubits/login_cubits/login_cubit.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_theme.dart';
import 'package:pixabay_gallery_mobile/ui/screens/login_flow/register_page.dart';
import 'package:pixabay_gallery_mobile/ui/screens/detailed_image_page/detailed_image_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<ImagesCubit>(
          create: (context) => ImagesCubit(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      routes: defineAppRoutes(),
      initialRoute: homeScreenRoute,
    );
  }

  Map<String, WidgetBuilder> defineAppRoutes() {
    return {
      splashScreenRoute: (context) => const SplashScreen(),
      homeScreenRoute: (context) => const HomePage(),
      profileScreenRoute: (context) => const ProfilePage(),
      detailedImageScreenRoute: (context) => const DetailedImagePage(),
      loginScreenRoute: (context) => const LoginPage(),
      registerScreenRoute: (context) => const RegisterPage(),
    };
  }
}
