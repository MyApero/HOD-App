import 'package:flutter/material.dart';

class SmallClickableText extends StatelessWidget {
  const SmallClickableText(this.title, {super.key, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'MulishSemiBold',
          decoration: TextDecoration.underline,
          decorationColor: Color(0xFFAEAED7),
          color: Color(0xFFAEAED7),
        ),
      ),
    );
  }
}
