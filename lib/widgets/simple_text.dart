import 'package:flutter/material.dart';
import 'package:hod_app/constants/fonts.dart';
import 'package:hod_app/theme/palette.dart';

class SimpleText extends StatelessWidget {
  const SimpleText(
    this.text, {
    super.key,
    this.textSize = 15,
    this.color = Palette.black,
    this.bold = false,
    this.textAlign = TextAlign.center,
  });

  final double textSize;
  final String text;
  final Color color;
  final bool bold;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: HodFonts.coolvetica,
        fontWeight: bold ? FontWeight.bold : null,
        fontSize: textSize,
        color: color,
      ),
    );
  }
}
