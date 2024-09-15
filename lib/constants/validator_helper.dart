import 'package:pixabay_gallery_mobile/constants/regex_patterns.dart';

class ValidatorHelper {
  static String? validateEmptyFormField<T>(T? value, String message) {
    if (value == null ||
        (value is Iterable && value.isEmpty) ||
        (value is String && value.isEmpty)) {
      return message;
    }
    return null;
  }

  static String? validateInvalidEmail(String? value, String message) {
    if (value != null && value.isNotEmpty && !emailRegExp.hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? validateInvalidPasswordLength(String? value,
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
}
