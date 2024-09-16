import 'package:flutter/material.dart';

class AppColors {
  // Define some primary colors
  static const Color primaryColor = Color(0xFF6200EE); // Purple
  static const Color secondaryColor = Color(0xFF03DAC6); // Teal
  static const Color accentColor = Color(0xFF03A9F4); // Light Blue

  // Define text colors
  static const Color black = Color(0xFF000000); // Black
  static const Color red = Color(0xFFFF0000); // Vibrant Red
  static const Color textLightColor = Color(0xFF757575); // Gray
  static const Color white = Color(0xFFFFFFFF); // White

  // Background colors
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Gray
  static const Color cardBackgroundColor = Color(0xFFFFFFFF); // White

  // Button colors
  static const Color dangerButtonBackgroundColor = Color(0xFFC62828); // Danger
  static const Color primaryButtonBackgroundColor = Color(0xFF6200EE); // Danger

  // Error and warning colors
  static const Color errorColor = Color(0xFFB00020); // Error red
  static const Color warningColor = Color(0xFFFFA000); // Orange

  // Success and info colors
  static const Color successColor = Color(0xFF4CAF50); // Green
  static const Color infoColor = Color(0xFF2196F3); // Blue

  // Define some gradient colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6200EE), Color(0xFF3700B3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Button colors
  static const Color buttonColor = Color(0xFF6200EE); // Purple
  static const Color buttonTextColor = Color(0xFFFFFFFF); // White
}
