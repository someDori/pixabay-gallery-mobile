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

TextStyle pageLoadErrorTextStyle = const TextStyle(
  fontSize: 18,
  color: AppColors.errorColor,
  fontWeight: FontWeight.w600,
);

TextStyle imageLoadErrorTextStyle = const TextStyle(
  fontSize: 14,
  color: AppColors.errorColor,
);

TextStyle userNameTextStyle = const TextStyle(
  fontSize: 16,
  color: AppColors.black,
  fontWeight: FontWeight.w400,
);

TextStyle pictureHeaderTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: AppColors.accentColor,
);

// Danger Button Style
ButtonStyle dangerButtonStyle = ButtonStyle(
  backgroundColor:
      WidgetStateProperty.all<Color>(AppColors.dangerButtonBackgroundColor),
  foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
  elevation: WidgetStateProperty.all<double>(2.0),
);

// Primary Button Style
ButtonStyle primaryButtonStyle = ButtonStyle(
  backgroundColor:
      WidgetStateProperty.all<Color>(AppColors.primaryButtonBackgroundColor),
  foregroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
  elevation: WidgetStateProperty.all<double>(2.0),
);
