import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  const SimpleText({super.key, required this.text, this.textSize = 20});

  final double textSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize)
    );
  }
}
