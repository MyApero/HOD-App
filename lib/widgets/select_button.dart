import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  SelectButton({super.key, required this.label, this.icon});

  final String label;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
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