import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HodFormField extends StatelessWidget {
  const HodFormField(
      {super.key,
      required this.label,
      this.controller,
      this.initialValue,
      this.validator,
      this.keyboardType,
      this.isTextShown = true,
      this.enableSuggestions = true,
      this.autocorrect = false,
      this.readOnly = false,
      this.suffixIcon,
      this.maxLines,
      this.onTap,
      this.onChanged});

  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType ?keyboardType;
  final bool isTextShown;
  final bool enableSuggestions;
  final bool autocorrect;
  final int? maxLines;
  final bool readOnly;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        initialValue: controller != null ? null : initialValue,
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
        readOnly: readOnly,
        onTap: onTap,
      ),
    );
  }
}
