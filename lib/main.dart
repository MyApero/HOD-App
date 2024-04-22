import 'package:flutter/material.dart';
import 'package:hod_app/features/authentification/login.dart';
import 'package:hod_app/features/theme/theme.dart';
import 'package:hod_app/features/theme/theme_screen.dart';
import 'package:hod_app/widgets/app_scaffold.dart';
import 'features/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> _pages = [
    LoginPage(),
    ThemeCard(boxColor: Colors.red, textColor: Colors.black,)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOD App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: AppScaffold(
        pages: _pages
      ),
      // home: ThemeTestScreen()
    );
  }
}
