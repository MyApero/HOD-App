import 'package:flutter/material.dart';
import 'package:hod_app/features/admin/screens/admin_screen.dart';
import 'package:hod_app/features/calendar/view/calendar_screen.dart';
import 'package:hod_app/features/home/view/home.dart';
import 'package:hod_app/features/navigation/view/navigation_screen.dart';
import 'package:hod_app/features/ragequit/ragequit_screen.dart';
import 'package:hod_app/widgets/background/app_background.dart';

class NavigationPages extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => NavigationPages());
  NavigationPages({super.key});

  final List<Widget> _pages = [
    const AppBackground(
      hasProfileIcon: true,
      title: "Home",
      child: HomeScreen(),
    ),
    const AppBackground(
      hasProfileIcon: true,
      title: "Calendrier",
      child: CalendarScreen(),
    ),
    const AppBackground(
      title: "Admin",
      child: AdminScreen(),
    ),
    const AppBackground(
      hasProfileIcon: true,
      title: "Ragequit :o",
      child: RagequitScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationScreen(pages: _pages);
  }
}