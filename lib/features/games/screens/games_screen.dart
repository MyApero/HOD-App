import 'package:flutter/material.dart';
import 'package:hod_app/features/rolegame/screens/main_role_game_screen.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleText("Liste des pôles"),
          SizedBox(height: 10),
          SelectButton(
            label: "Jeux de Rôle",
            onPressed: () => Navigator.of(context).push(
              MainRoleGameScreen.route(),
            ),
          ),
          SizedBox(height: 10),
          SelectButton(label: "Jeux de Société"),
          SizedBox(height: 10),
          SelectButton(label: "Jeux de Réflexion"),
          SizedBox(height: 10),
          SelectButton(label: "Trading Card Game"),
          SizedBox(height: 10),
          SelectButton(label: "Loup-Garou"),
          SizedBox(height: 10),
          SelectButton(label: "War Games"),
        ],
      ),
    );
  }
}
