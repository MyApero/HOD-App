import 'package:flutter/material.dart';
import 'package:hod_app/constants/fonts.dart';
import 'package:hod_app/theme/palette.dart';

class SimpleText extends StatelessWidget {
  const SimpleText(this.text, {super.key, this.textSize = 15, this.color = Palette.black});

  final double textSize;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: HodFonts.coolvetica,
        fontWeight: FontWeight.bold,
        fontSize: textSize,
        color: color
      ),
    );
  }
}
