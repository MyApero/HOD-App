import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod_app/features/poles/boardgame/screens/main_boardgame_screen.dart';
import 'package:hod_app/features/poles/reflexiongame/screens/main_reflexiongame_screen.dart';
import 'package:hod_app/features/poles/rolegame/screens/main_role_game_screen.dart';
import 'package:hod_app/features/poles/tradingcardgame/screens/main_tradingcardgame_screen.dart';
import 'package:hod_app/features/poles/wargame/screens/main_wargame_screen.dart';
import 'package:hod_app/features/poles/werewolf/screens/main_werewolf_screen.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class PoleHomeScreen extends StatelessWidget {
  const PoleHomeScreen({super.key});

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
            icon: FontAwesomeIcons.dragon,
            onPressed: () => Navigator.of(context).push(
              MainRoleGameScreen.route(),
            ),
          ),
          SizedBox(height: 10),
          SelectButton(
            label: "Jeux de Société",
            icon: FontAwesomeIcons.dice,
            onPressed: () =>
                Navigator.of(context).push(MainBoardGameScreen.route()),
          ),
          SizedBox(height: 10),
          SelectButton(
              label: "Jeux de Réflexion",
              icon: FontAwesomeIcons.chess,
              onPressed: () =>
                  Navigator.of(context).push(MainReflexionGameScreen.route())),
          SizedBox(height: 10),
          SelectButton(
            label: "Trading Card Game",
            icon: FontAwesomeIcons.ccVisa,
            onPressed: () =>
                Navigator.of(context).push(MainTradingCardGameScreen.route()),
          ),
          SizedBox(height: 10),
          SelectButton(
              label: "Loup-Garou",
              icon: FontAwesomeIcons.wolfPackBattalion,
              onPressed: () =>
                  Navigator.of(context).push(MainWereWolfScreen.route())),
          SizedBox(height: 10),
          SelectButton(
            label: "War Games",
            icon: FontAwesomeIcons.personRifle,
            onPressed: () =>
                Navigator.of(context).push(MainWarGameScreen.route()),
          ),
        ],
      ),
    );
  }
}
