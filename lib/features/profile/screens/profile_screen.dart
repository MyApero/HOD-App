import 'package:flutter/material.dart';
import 'package:hod_app/features/profile/screens/personnalisation_screen.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
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
          children: [
            const PlayerCard(),
            SelectButton(
                label: "Personnalisation",
                onPressed: () {
                  Navigator.of(context).push(PersonnalisationScreen.route());
                },
                icon: Icons.arrow_circle_right_outlined),
          ],
        ));
  }
}
