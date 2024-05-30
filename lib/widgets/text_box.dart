import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  TextBox({super.key, required this.label, required this.isPassword});

  final String label;
  bool isPassword;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool viewPwd = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'MulishSemiBold',
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
          // fillColor: Theme.of(context).colorScheme.,
          labelText: widget.label, // Placeholder text
          border: const OutlineInputBorder(), // Border style
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {
                    setState(() {
                      viewPwd = !viewPwd;
                    });
                  })
              : null),
      obscureText: !viewPwd,
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
    );
  }
}
