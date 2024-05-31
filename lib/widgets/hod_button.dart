import 'package:flutter/material.dart';

class HodButton extends StatelessWidget {
  const HodButton({super.key, required this.label, required this.onTapped, this.textFontSize = 24});

  final String label;
  final void Function() onTapped;
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(20),
        ),
        minimumSize: WidgetStateProperty.all(
          const Size(400, 50),
        ),
      ),
      onPressed: onTapped,
      child: Text(label,
          style: TextStyle(
            fontSize: textFontSize,
            fontFamily: 'Coolvetica',
            color: Theme.of(context).colorScheme.onPrimary,
          )),
    );
  }
}
