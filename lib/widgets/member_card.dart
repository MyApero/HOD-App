import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        Navigator.of(context).pop();
      },
      child: Container(
        color: Palette.purple,
        child: const Column(
          children: [
            Text(
              "Carte de Membre",
              style: TextStyle(
                fontSize: 15,
                color: Palette.white,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      PlayerCardItem(fieldKey: "ok", fieldValue: "ok"),
                      PlayerCardItem(fieldKey: "ok", fieldValue: "ok"),
                      PlayerCardItem(fieldKey: "ok", fieldValue: "ok"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
