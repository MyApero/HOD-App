import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod_app/features/profile/screens/personnalisation_screen.dart';
import 'package:hod_app/features/profile/widget/player_card_data.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/player_card.dart';
import 'package:hod_app/widgets/select_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const ProfileScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Profil",
      hasBackArrow: true,
      child: PlayerCardData(
        builder: (playerCard) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerCard(
                keys: playerCard.keys,
                values: playerCard.values,
                male: playerCard.male,
              ),
              SelectButton(
                  label: "Personnalisation",
                  onPressed: () {
                    Navigator.of(context).push(PersonnalisationScreen.route());
                  },
                  icon: FontAwesomeIcons.arrowRight),
            ]),
      ),
    );
  }
}
