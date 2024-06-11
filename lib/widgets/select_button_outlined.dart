import 'package:flutter/material.dart';

class SelectButtonOutlined extends StatelessWidget {
  const SelectButtonOutlined(
      {super.key, required this.label, this.icon, this.onPressed, this.color});

  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(
          Size(double.infinity, 65),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontFamily: "CoolveticaCondensed",
                fontSize: 20,
                color: Colors.black87,
              )),
          const Spacer(),
          if (icon != null)
            Icon(
              size: 30,
              icon!,
              color: Colors.black87,
            ),
        ],
      ),
    );
  }
}
