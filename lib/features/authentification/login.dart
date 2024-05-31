import 'package:flutter/material.dart';
import 'package:hod_app/features/authentification/register.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/small_text.dart';
import 'package:hod_app/widgets/text_box.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(height: 120),
                TextBox(label: "Email", isPassword: false),
                const SizedBox(height: 30),
                TextBox(
                  label: "Mot de passe",
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                Container(
                padding: const EdgeInsets.all(15),
                child: HodButton(
                  label: "Me connecter",
                  onTapped: () {},
                )),
              ],
            ),
            Column(
              children: [
                const SmallText(title: "J'ai oublié mon mot de passe"),
                SizedBox(height: 10),
                SmallText(
                    title: "M'inscrire",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
