import 'package:flutter/material.dart';
import 'package:hod_app/features/calendar/view/calendar_screen.dart';
import 'package:hod_app/features/card/screens/card_screen.dart';
import 'package:hod_app/features/home/view/home.dart';
import 'package:hod_app/features/ragequit/ragequit_screen.dart';
import 'package:hod_app/tests/events_screen_test.dart';
import 'package:hod_app/tests/theme_screen.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';

class NavigationScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => NavigationScreen());
  NavigationScreen({super.key});

  final List<Widget> _pages = [
    AppBackground(
      title: "Home",
      child: HomeScreen(),
    ),
    AppBackground(
      title: "Calendrier",
      child: CalendarScreen(),
    ),
    const AppBackground(
      title: "Ragequit :o",
      child: RagequitScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(pages: _pages);
  }
}
