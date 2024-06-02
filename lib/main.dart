import 'package:flutter/material.dart';
import 'package:hod_app/features/auth/view/login.dart';
import 'package:hod_app/features/auth/view/register.dart';
import 'package:hod_app/features/onboarding/onboarding_screen.dart';
import 'package:hod_app/theme/theme.dart';
import 'package:hod_app/tests/background_test.dart';
import 'package:hod_app/tests/test_screen.dart';
import 'package:hod_app/tests/theme_screen.dart';
import 'package:hod_app/tests/FlexTest.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/background/nice/nice_background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> _pages = [
    AppBackground(
        title: "ME CONNECTER",
        child: ThemeCard(
          boxColor: Colors.red,
          textColor: Colors.black,
        )),
    AppBackground(
        title: "Biffler des ia ?",
        child: ThemeCard(
          boxColor: Colors.red,
          textColor: Colors.black,
        )),
    AppBackground(
        title: "zappou zappy",
        child: ThemeCard(
          boxColor: Colors.red,
          textColor: Colors.black,
        )),
    AppBackground(
        title: "North pole",
        child: ThemeCard(
          boxColor: Colors.red,
          textColor: Colors.black,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOD App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: AppScaffold(pages: _pages),
      // home: RegisterScreen(),
      home: LoginScreen(),
      // home: AppScaffold(pages: _pages),
      // home: TestScreen(),
    );
  }
}
