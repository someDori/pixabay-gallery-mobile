import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app_ui/colors/app_colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Roboto',
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
    );
  }
}

TextStyle firstTimeTextStyle = const TextStyle(
  fontSize: 16,
  color: AppColors.black,
  fontWeight: FontWeight.w300,
);

TextStyle headerTextStyle = const TextStyle(
  fontSize: 32,
  color: AppColors.black,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.2,
  height: 1.3,
);

TextStyle passwordToggleTextStyle = const TextStyle(
  fontSize: 14,
  color: Colors.blue,
  fontWeight: FontWeight.w500,
);
