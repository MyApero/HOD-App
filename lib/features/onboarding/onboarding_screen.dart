import 'package:flutter/material.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/nice_background.dart';
import 'package:hod_app/widgets/small_text.dart';
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
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 50),
            const Image(
              image: AssetImage('assets/images/logo_1_heaven_of_dice.png'),
            ),
            const SizedBox(height: 150),
            HodButton(label: "Welcome in HOD", onTapped: () {}),
            const SizedBox(height: 60),
            SmallText(
              title: "Mentions légales et CGU",
              onPressed: () {
                launchUrlString("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/640px-Cat03.jpg");
              },
            ),
            SmallText(title: "Contactez nous", onPressed: () {
              launchUrlString("https://discord.gg/CBSRt6mvsR");
            }),
          ],
        ),
      ),
    );
  }
}
