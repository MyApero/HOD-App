import 'package:flutter/material.dart';
import 'package:hod_app/apis/event_api.dart';
import 'package:hod_app/features/poles/widget/event_details_screen.dart';
import 'package:hod_app/features/poles/rolegame/screens/role_characters.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/select_button.dart';

class MainRoleGameScreen extends StatelessWidget {
  const MainRoleGameScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainRoleGameScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: "Pole jeux de rôles",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectButton(
              label: "Mes personnages",
              icon: Icons.person_outline_outlined,
              onPressed: () => Navigator.of(context).push(
                RoleCharacters.route(),
              ),
            ),
            SelectButton(
              label: "Prochains événements",
              icon: Icons.event,
              onPressed: () => Navigator.of(context).push(
                EventDetailsScreen.route(
                    title: "Jeux de rôle", pole: Pole.rolegame.name),
              ),
            )
          ],
        ));
  }
}
