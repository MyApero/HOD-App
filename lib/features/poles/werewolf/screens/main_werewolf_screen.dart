import 'package:flutter/material.dart';
import 'package:hod_app/features/poles/widget/event_details_screen.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/select_button.dart';

class MainWereWolfScreen extends StatelessWidget {
  const MainWereWolfScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainWereWolfScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: "Loup-garou",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectButton(label: "Rôles"),
            SelectButton(
              label: "Events details",
              onPressed: () => Navigator.of(context).push(
                EventDetailsScreen.route(title: "Loup-garou", pole: "werewolf"),
              ),
            )
          ],
        ));
  }
}
