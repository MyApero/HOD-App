import 'package:flutter/material.dart';

class PlayerCardItem extends StatelessWidget {
  const PlayerCardItem(
      {super.key, required this.fieldKey, required this.fieldValue});

  final String fieldKey;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE3E3F1),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 25,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(5.0),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          const SizedBox(width: 5),
          Text(
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "CoolveticaCondensed",
                color: Colors.black,
              ),
              fieldKey.toUpperCase()),
          Spacer(),
           Text(
              style: TextStyle(
                fontSize: 14,
                fontFamily: "CoolveticaCondensed",
                color: Color(0xFF909090),
              ),
              fieldValue),
        ],
      ),
    );
  }
}
