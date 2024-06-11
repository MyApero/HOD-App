import 'package:flutter/material.dart';
import 'package:hod_app/features/poll/view/create_poll.dart';
import 'package:hod_app/features/poll/view/join_poll.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/select_button.dart';

class PollHomeScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => const PollHomeScreen());
  const PollHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: "Sondages",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectButton(
                label: "Créer un sondage",
                onPressed: () {
                  Navigator.of(context).push(CreatePollScreen.route());
                },
                icon: Icons.arrow_right_alt_rounded),
            const SizedBox(height: 15),
            SelectButton(
                label: "Rejoindre un sondage",
                onPressed: () {
                  Navigator.of(context).push(JoinPollScreen.route());
                },
                icon: Icons.arrow_right_alt_rounded),
            const SizedBox(height: 100),
          ],
        ));
  }
}
