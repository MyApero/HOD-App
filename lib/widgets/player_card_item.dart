import 'package:flutter/material.dart';

class PlayerCardItem extends StatelessWidget {
  const PlayerCardItem(
      {super.key, required this.fieldKey, required this.fieldValue});

  final String fieldKey;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFAEAED7),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 25,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.all(5.0),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(width: 5),
          Text(
              style: TextStyle(
                fontSize: 12,
                fontFamily: "CoolveticaCondensed",
                color: Colors.black,
              ),
              fieldKey.toUpperCase()),
          Spacer(),
          Text(fieldValue),
        ],
      ),
    );
  }
}
