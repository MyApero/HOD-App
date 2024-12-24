import 'package:flutter/material.dart';
import 'package:hod/features/poles/widget/event_details_screen.dart';

class MainBoardGameScreen extends StatelessWidget {
  const MainBoardGameScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainBoardGameScreen());

  @override
  Widget build(BuildContext context) {
    return EventDetailsScreen(
      title: "Jeux de sociétés",
      pole: "boardgame",
    );
  }
}
