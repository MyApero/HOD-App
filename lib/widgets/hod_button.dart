import 'package:flutter/material.dart';

class HodButton extends StatelessWidget {
  const HodButton({super.key, required this.label, required this.onTapped});

  final String label;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(20),
          ),
          minimumSize: WidgetStateProperty.all(
            const Size(400, 50),
          ),
          // backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background),
          ),
      onPressed: onTapped,
      child: Text(label,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'MulishSemiBold',
            color: Theme.of(context).colorScheme.surface,
          )),
    );
  }
}
