import 'package:flutter/material.dart';
import 'package:hod/features/poll/view/create_poll.dart';
import 'package:hod/features/poll/view/poll_list.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/select_button.dart';

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
            const Expanded(child: PollList()),
            const SizedBox(height: 15),
            SelectButton(
              label: "Créer un sondage",
              onPressed: () {
                Navigator.of(context).push(CreatePollScreen.route());
              },
              icon: Icons.add,
            ),
          ],
        ));
  }
}
