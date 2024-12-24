import 'package:flutter/material.dart';
import 'package:hod/features/poles/reflexiongame/screens/timer.dart';
import 'package:hod/features/poles/widget/event_details_screen.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/select_button.dart';

class MainReflexionGameScreen extends StatelessWidget {
  const MainReflexionGameScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (ctx) => MainReflexionGameScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: "Pole réflexion",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectButton(
              label: "Timer",
              onPressed: () => Navigator.of(context).push(
                TimerScreen.route(),
              ),
            ),
            // SelectButton(label: "Elo chess"),
            // SelectButton(label: "Leaderboard"),
            SelectButton(
              label: "Prochains événements",
              icon: Icons.event,
              onPressed: () => Navigator.of(context).push(
                EventDetailsScreen.route(title: "Réflexion", pole: "chess"),
              ),
            )
          ],
        ));
  }
}
