import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({super.key, required this.label, this.icon, this.onPressed});

  final String label;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
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
          Text(label),
          const Spacer(),
          if (icon != null) Icon(size: 40, icon!),
        ],
      ),
    );
  }
}
