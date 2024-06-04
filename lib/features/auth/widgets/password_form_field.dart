import 'package:flutter/material.dart';
import 'package:hod_app/widgets/auth_field.dart';

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
    return AuthField(
      label: widget.label,
      controller: widget.controller,
      isTextShown: viewPwd,
      hasSuggestions: false,
      suffixIcon: IconButton(
          icon: Icon(viewPwd ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              viewPwd = !viewPwd;
            });
          }),
      validator: (value) {
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

// import 'package:flutter/material.dart';

// class AuthField extends StatefulWidget {
//   const AuthField({
//     super.key,
//     required this.label,
//     required this.isPassword,
//     this.controller,
//   });

//   final TextEditingController? controller;
//   final String label;
//   final bool isPassword;

//   @override
//   State<AuthField> createState() => _AuthFieldState();
// }

// class _AuthFieldState extends State<AuthField> {
//   bool viewPwd = false;

//   @override
//   void initState() {
//     viewPwd = !widget.isPassword;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       style: TextStyle(
//         fontSize: 18,
//         fontFamily: 'MulishSemiBold',
//         color: Theme.of(context).colorScheme.onSurface,
//       ),
//       decoration: InputDecoration(
//           // fillColor: Theme.of(context).colorScheme.,
//           labelText: widget.label, // Placeholder text
//           border: const OutlineInputBorder(), // Border style
//           suffixIcon: widget.isPassword
//               ? IconButton(
//                   icon: Icon(viewPwd ? Icons.visibility : Icons.visibility_off),
//                   onPressed: () {
//                     setState(() {
//                       viewPwd = !viewPwd;
//                     });
//                   })
//               : null),
//       obscureText: !viewPwd,
//       enableSuggestions: !widget.isPassword,
//       autocorrect: !widget.isPassword,
//     );
//   }
// }
