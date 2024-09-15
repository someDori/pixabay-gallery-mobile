import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixabay_gallery_mobile/app_ui/theme/app_spacing.dart';

class AgeFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const AgeFormField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        contentPadding: AppSpacing.sixteenAll,
      ),
      validator: validator ?? _defaultAgeValidator,
    );
  }

  String? _defaultAgeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    int? age = int.tryParse(value);
    if (age == null || age < 0 || age > 120) {
      return 'Please enter a valid age between 0 and 120';
    }
    return null;
  }
}
