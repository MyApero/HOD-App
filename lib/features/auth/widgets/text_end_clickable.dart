import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';

class TextEndClickable extends StatelessWidget {
  const TextEndClickable({
    super.key,
    required this.frontText,
    required this.endText,
    this.frontTextColor = Palette.black,
    this.endTextColor = Colors.blue,
    this.onEndTapped,
  });

  final String frontText;
  final String endText;
  final Color frontTextColor;
  final Color endTextColor;
  final void Function()? onEndTapped;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: frontText,
          style: TextStyle(
              fontSize: 13, color: frontTextColor),
          children: [
            TextSpan(
                text: endText,
                style: TextStyle(
                    fontSize: 13,
                    color: endTextColor,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onEndTapped?.call();
                  }),
          ]),
    );
  }
}
