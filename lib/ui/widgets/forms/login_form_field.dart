import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String?)? validator;

  const LoginFormField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.suffix,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        label: Text(label),
        suffix: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      validator: validator,
    );
  }
}
