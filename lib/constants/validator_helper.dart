import 'package:pixabay_gallery_mobile/constants/regex_patterns.dart';

class ValidatorHelper {
  static String? validateFormField<T>(T? value, String message) {
    if (value == null ||
        (value is Iterable && value.isEmpty) ||
        (value is String && value.isEmpty)) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String? value, String message) {
    if (value != null && value.isNotEmpty && !emailRegExp.hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? validatePasswordLength(String? value,
      {int min = 6, int max = 12}) {
    if (value != null && value.isNotEmpty) {
      if (value.length < min) {
        return 'Password should be at least $min letters long';
      } else if (value.length > max) {
        return 'Password shouldn\'t be more than $max letters long';
      }
    }
    return null;
  }

  static String? validatePasswordsMatch(
    String? passwordValue,
    String? confirmPasswordValue,
  ) {
    if (passwordValue != null && confirmPasswordValue != null) {
      if (passwordValue != confirmPasswordValue) {
        return 'Passwords should match';
      }
    }
    return null;
  }

  static String? validateAge(String? value, {int min = 18, int max = 99}) {
    if (value != null) {
      int valueToInt = int.parse(value);
      if (valueToInt < min) {
        return 'User shouldn\'t be younger than $min years';
      } else if (valueToInt > max) {
        return 'User shouldn\'t be older than $max years';
      }
    }
    return null;
  }
}
