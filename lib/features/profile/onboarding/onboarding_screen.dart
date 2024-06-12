import 'package:flutter/material.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/features/background/nice/nice_background.dart';
import 'package:hod_app/widgets/hod_logo.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            HodLogo(width: MediaQuery.of(context).size.width * 0.9),
            const SizedBox(height: 50),
            HodButton(
                label: "Bienvenue dans HOD", onTapped: () {}, textFontSize: 31),
            const SizedBox(height: 30),
            SmallClickableText(
              "Mentions légales et CGU",
              onPressed: () {
                launchUrlString(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/640px-Cat03.jpg");
              },
            ),
            SmallClickableText(
                "Contactez nous",
                onPressed: () {
                  launchUrlString("https://discord.gg/CBSRt6mvsR");
                }),
          ],
        ),
      ),
    );
  }
}
