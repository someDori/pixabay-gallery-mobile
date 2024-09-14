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
