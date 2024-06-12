import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
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
  static route() =>
      MaterialPageRoute(builder: (context) => const NavigationPages());
  const NavigationPages({super.key});

  Future<Map<String, dynamic>> getPages() async {
    UserModel? user = await AuthApi.getUser();

    return {
      "list": [
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
        if (user!.role == Role.admin || user.role == Role.staff)
          const AppBackground(
            hasProfileIcon: true,
            title: "Administration",
            child: AdminScreen(),
          ),
        if (user.role == Role.member)
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
      ],
      "role": user.role
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('An error occurred'));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('No data'));
        }
        return NavigationScreen(
            pages: snapshot.data!["list"] as List<Widget>,
            userRole: snapshot.data!["role"] as Role);
      },
    );
  }
}
