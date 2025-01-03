import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod/theme/palette.dart';

class SelectButton extends StatelessWidget {
  const SelectButton(
      {super.key, required this.label, this.icon, this.onPressed, this.color});

  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: color != null
            ? WidgetStateProperty.all(color)
            : WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(
          Size(double.infinity, 80),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontFamily: "CoolveticaCondensed",
                fontSize: 24,
                color: Palette.white,
              )),
          const Spacer(),
          if (icon != null) FaIcon(size: 25, icon!),
        ],
      ),
    );
  }
}
