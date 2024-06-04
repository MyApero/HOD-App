import 'package:flutter/material.dart';
import 'package:hod_app/features/card/screens/card_screen.dart';
import 'package:hod_app/features/ragequit/ragequit_screen.dart';
import 'package:hod_app/tests/events_screen_test.dart';
import 'package:hod_app/tests/theme_screen.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());
  HomeScreen({super.key});

  final List<Widget> _pages = [
    const AppBackground(
      title: "Ragequit",
      child: RagequitScreen(),
    ),
    const AppBackground(title: "Biffler des ia ?", child: EventsScreenTest()),
    const AppBackground(
        title: "Ma carte très très très très très très très trèes longue",
        child: CardScreen()),
    const AppBackground(
        title: "North pole",
        child: ThemeCard(
          boxColor: Colors.red,
          textColor: Colors.black,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(pages: _pages);
  }
}
