import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod/features/poles/werewolf/screens/main_role_screen.dart';
import 'package:hod/features/poles/widget/event_details_screen.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/select_button.dart';

class MainWereWolfScreen extends StatelessWidget {
  const MainWereWolfScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (ctx) => const MainWereWolfScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: "Loup-garou",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectButton(
              label: "Rôles",
              icon: FontAwesomeIcons.hatCowboy,
              onPressed: () {
                Navigator.of(context).push(MainRoleScreen.route());
              },
            ),
            SelectButton(
              label: "Prochains événements",
              icon: Icons.event,
              onPressed: () => Navigator.of(context).push(
                EventDetailsScreen.route(title: "Loup-garou", pole: "werewolf"),
              ),
            )
          ],
        ));
  }
}
