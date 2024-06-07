import 'package:flutter/material.dart';
import 'package:hod_app/features/games/screens/widget/event_details_screen.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
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
            SelectButton(label: "Sessions de jeux de rôle"),
            SelectButton(
              label: "Event details",
              onPressed: () => Navigator.of(context).push(
                EventDetailsScreen.route(title: "Jeux de rôle", pole: "rolegame"),
              ),
            )
          ],
        ));
  }
}
