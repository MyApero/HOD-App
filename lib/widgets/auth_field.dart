import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.isTextShown = true,
    this.hasSuggestions = true,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isTextShown;
  final bool hasSuggestions;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'MulishSemiBold',
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
          // fillColor: Theme.of(context).colorScheme.,
          labelText: label, // Placeholder text
          border: const OutlineInputBorder(), // Border style
          suffixIcon: suffixIcon,
          ),
      obscureText: !isTextShown,
      enableSuggestions: hasSuggestions,
      autocorrect: hasSuggestions,
    );
  }
}
