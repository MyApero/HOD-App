import 'package:flutter/material.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/nice_background.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NiceBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(
              image: AssetImage('assets/images/logo_1_heaven_of_dice.png'),
            ),
            HodButton(label: "Welcome in HOD", onTapped: () {}),
            TextButton(
              onPressed: () {
                launchUrlString("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/640px-Cat03.jpg");
              },
              child: const Text(
                "Mentions légales et CGU",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'MulishSemiBold',
                  color: Color(0xFFAEAED7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
