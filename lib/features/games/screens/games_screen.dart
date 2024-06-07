import 'package:flutter/material.dart';
import 'package:hod_app/features/boardgame/screens/main_boardgame_screen.dart';
import 'package:hod_app/features/reflexiongame/screens/main_reflexiongame_screen.dart';
import 'package:hod_app/features/rolegame/screens/main_role_game_screen.dart';
import 'package:hod_app/features/tradingcardgame/screens/main_tradingcardgame_screen.dart';
import 'package:hod_app/features/wargame/screens/main_wargame_screen.dart';
import 'package:hod_app/features/werewolf/screens/main_werewolf_screen.dart';
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
          SelectButton(
            label: "Jeux de Société",
            onPressed: () =>
                Navigator.of(context).push(MainBoardGameScreen.route()),
          ),
          SizedBox(height: 10),
          SelectButton(
              label: "Jeux de Réflexion",
              onPressed: () =>
                  Navigator.of(context).push(MainReflexionGameScreen.route())),
          SizedBox(height: 10),
          SelectButton(
            label: "Trading Card Game",
            onPressed: () =>
                Navigator.of(context).push(MainTradingCardGameScreen.route()),
          ),
          SizedBox(height: 10),
          SelectButton(
              label: "Loup-Garou",
              onPressed: () =>
                  Navigator.of(context).push(MainWereWolfScreen.route())),
          SizedBox(height: 10),
          SelectButton(
            label: "War Games",
            onPressed: () =>
                Navigator.of(context).push(MainWarGameScreen.route()),
          ),
        ],
      ),
    );
  }
}
