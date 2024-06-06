import 'package:flutter/material.dart';

class HodFormField extends StatelessWidget {
  const HodFormField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.isTextShown = true,
    this.enableSuggestions = true,
    this.autocorrect = false,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isTextShown;
  final bool enableSuggestions;
  final bool autocorrect;
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
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
    );
  }
}
