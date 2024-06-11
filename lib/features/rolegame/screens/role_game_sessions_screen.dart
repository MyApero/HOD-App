import 'package:flutter/material.dart';
import 'package:hod_app/features/rolegame/screens/create_new_character.dart';
import 'package:hod_app/features/rolegame/screens/role_card_info_screen.dart';
import 'package:hod_app/features/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/select_button.dart';

class RoleGameSessionsScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => RoleGameSessionsScreen());

  RoleGameSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Personnages",
      hasBackArrow: true,
      child: RoleCardData(
        builder: (roleCards) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...roleCards.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SelectButton(
                          label: e.name,
                          icon: Icons.arrow_circle_right_outlined,
                          onPressed: () => Navigator.of(context).push(
                              RoleCardInfoScreen.route(
                                  name: e.name, id: e.id!)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            HodButton(
              label: "Créer un nouveau personnage",
              onTapped: () {
                showCreateNewCharacter(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
