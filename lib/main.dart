import 'package:flutter/material.dart';
import 'package:hod_app/features/authentification/login.dart';
import 'package:hod_app/features/theme/theme.dart';
import 'package:hod_app/features/theme/theme_screen.dart';
import 'package:hod_app/widgets/app_scaffold.dart';
import 'features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOD App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const AppScaffold(
        title: "Me connecter",
        child: LoginPage()
      ),
      // home: ThemeTestScreen()
    );
  }
}
