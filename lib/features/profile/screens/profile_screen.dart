import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/player_card.dart';
import 'package:hod_app/widgets/select_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static route() => MaterialPageRoute(builder: (context) => ProfileScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Profil",
        hasBackArrow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [const PlayerCard(),
          SelectButton(label: "Personnalisation", onPressed: () {}, icon: Icons.arrow_circle_right_outlined),
          SelectButton(label: "Réglages", onPressed: () {}, icon: Icons.arrow_circle_right_outlined)],
        ));
  }
}
