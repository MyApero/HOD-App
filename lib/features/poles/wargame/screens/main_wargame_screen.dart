import 'package:flutter/material.dart';
import 'package:hod_app/features/poles/home/screens/widget/event_details_screen.dart';

class MainWarGameScreen extends StatelessWidget {
  const MainWarGameScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainWarGameScreen());

  @override
  Widget build(BuildContext context) {
    return EventDetailsScreen(title: "War games", pole: "wargame",);
  }
}
