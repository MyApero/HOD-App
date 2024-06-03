import 'package:flutter/material.dart';
import 'package:hod_app/widgets/player_card.dart';
import 'package:hod_app/widgets/select_button.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 640,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerCard(),
            SelectButton(label: "Personnalisation", icon: Icons.arrow_circle_right_outlined),
            SelectButton(label: "Réglages", icon: Icons.arrow_circle_right_outlined),
          ],
        ),
      ),
    );
  }
}
