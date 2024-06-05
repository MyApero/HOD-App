import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  const SimpleText(this.text, {super.key, this.textSize = 15});

  final double textSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        
        fontWeight: FontWeight.bold,
        fontSize: textSize,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
