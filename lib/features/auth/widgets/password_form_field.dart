import 'package:flutter/material.dart';
import 'package:hod_app/widgets/hod_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.label = "Mot de passe",
    this.controller,
    this.validator,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool viewPwd = false;

  @override
  Widget build(BuildContext context) {
    return HodFormField(
      label: widget.label,
      controller: widget.controller,
      isTextShown: viewPwd,
      enableSuggestions: false,
      autocorrect: false,
      suffixIcon: IconButton(
          icon: Icon(viewPwd ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              viewPwd = !viewPwd;
            });
          }),
      validator: (value) {
        if (widget.validator == null) {
          return null;
        }
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer un mot de passe';
        }
        if (value.length < 8) {
          return 'Le mot de passe doit contenir au moins 8 caractères';
        }
        if (widget.validator != null) {
          return widget.validator!.call(value);
        }
        return null;
      }
    );
  }
}
