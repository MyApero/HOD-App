import 'package:flutter/material.dart';
import 'package:hod_app/apis/local_api.dart';
import 'package:hod_app/features/admin/screens/admin_screen.dart';
import 'package:hod_app/features/calendar/view/calendar_screen.dart';
import 'package:hod_app/features/poles/home/screens/home_pole_screen.dart';
import 'package:hod_app/features/home/view/home.dart';
import 'package:hod_app/features/navigation/view/navigation_screen.dart';
import 'package:hod_app/features/poll/view/poll_list.dart';
import 'package:hod_app/features/settings/screens/settings_screen.dart';
import 'package:hod_app/features/background/app_background.dart';
import 'package:hod_app/models/user_model.dart';

class NavigationPages extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => NavigationPages());
  NavigationPages({super.key});

  final List<Widget> _pages = [
    const AppBackground(
      hasProfileIcon: true,
      title: "Accueil",
      child: HomeScreen(),
    ),
    const AppBackground(
      hasProfileIcon: true,
      title: "Calendrier",
      child: CalendarScreen(),
    ),
    if (LocalApi.getCurrentUser().role == Role.admin ||
        LocalApi.getCurrentUser().role == Role.staff)
      const AppBackground(
        hasProfileIcon: true,
        title: "Administration",
        child: AdminScreen(),
      ),
    if (LocalApi.getCurrentUser().role == Role.member)
      const AppBackground(
        hasProfileIcon: true,
        title: "Sondages",
        child: PollList(isStaff: false),
      ),
    const AppBackground(
      hasProfileIcon: true,
      title: "Pôles",
      child: PoleHomeScreen(),
    ),
    const AppBackground(
      title: "Paramètres",
      child: SettingsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationScreen(
      pages: _pages,
    );
  }
}
