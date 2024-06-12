import 'package:flutter/material.dart';
import 'package:hod_app/features/poles/home/screens/widget/event_details_screen.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/select_button.dart';

class MainReflexionGameScreen extends StatelessWidget {
  const MainReflexionGameScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainReflexionGameScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
        title: "Pole réflexion",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectButton(label: "Timer"),
            SelectButton(label: "Elo chess"),
            SelectButton(label: "Leaderboard"),
            SelectButton(
              label: "Events details",
              onPressed: () => Navigator.of(context).push(
                EventDetailsScreen.route(title: "Réflexion", pole: "chess"),
              ),
            )
          ],
        ));
  }
}
