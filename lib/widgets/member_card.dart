import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
