import 'package:flutter/material.dart';
import 'package:hod/core/utils.dart';
import 'package:hod/features/auth/widgets/text_end_clickable.dart';
import 'package:hod/theme/palette.dart';

class CguCheckbox extends StatelessWidget {
  const CguCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.hasError = false,
  });

  final bool value;
  final void Function(bool) onChanged;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      // title: RichText(
      //   text: TextSpan(
      //       text: "J’accepte les",
      //       style: TextStyle(
      //           fontSize: 13, color: hasError ? Palette.error : Palette.black),
      //       children: [
      //         TextSpan(
      //             text: " Conditions Générales d’Utilisation",
      //             style: TextStyle(
      //                 fontSize: 13,
      //                 color: hasError ? Palette.error : Colors.blue,
      //                 decoration: TextDecoration.underline),
      //             recognizer: TapGestureRecognizer()
      //               ..onTap = () {
      //                 showSnackBar(context, "Respect, Bienveillance et Ordre.");
      //               }),
      //       ]),
      // ),
      title: TextEndClickable(
        frontText: "J’accepte les ",
        endText: "Conditions Générales d’Utilisation",
        frontTextColor: hasError ? Palette.error : Palette.black,
        endTextColor: hasError ? Palette.error : Colors.blue,
        onEndTapped: () {
          showSnackBar(context, "Respect, Bienveillance et Ordre.");
        },
      ),
      value: value,
      onChanged: (newValue) {
        if (newValue == null) return;
        onChanged(newValue);
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
