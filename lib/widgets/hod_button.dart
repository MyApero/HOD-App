import 'package:flutter/material.dart';
import 'package:hod/widgets/loader.dart';

class HodButton extends StatelessWidget {
  const HodButton(
      {super.key,
      required this.label,
      required this.onTapped,
      this.textFontSize = 24,
      this.isLoading = false});

  final String label;
  final void Function() onTapped;
  final double textFontSize;
  final bool isLoading;

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
      onPressed: isLoading ? null : onTapped,
      child: isLoading
          ? const Loader()
          : Text(label,
              style: TextStyle(
                fontSize: textFontSize,
                fontFamily: 'Coolvetica',
                color: Theme.of(context).colorScheme.onPrimary,
              )),
    );
  }
}
