import 'package:flutter/material.dart';
import 'package:hod_app/features/games/screens/widget/event_details_screen.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/select_button.dart';

class MainBoardGameScreen extends StatelessWidget {
  const MainBoardGameScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainBoardGameScreen());

  @override
  Widget build(BuildContext context) {
    return EventDetailsScreen(title: "Jeux de sociétés", pole: "boardgame",);
  }
}