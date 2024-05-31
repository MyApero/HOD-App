import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:hod_app/widgets/text_box.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool cguValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        title: "M'inscrire",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Row(
                    children: [
                      SizedBox(width: 12),
                      SimpleText(text: "Mon mot de passe"),
                    ],
                  ),
                ),
                const TextBox(
                  label: "Mot de passe",
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                const TextBox(
                  label: "Confirmation",
                  isPassword: true,
                ),
                CheckboxListTile(
                  title:
                      const Text("J’accepte les Conditions Générales d’Utilisation"),
                  value: cguValue,
                  onChanged: (newValue) {
                    setState(() {
                      cguValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: HodButton(
                    label: "Créer mon compte",
                    onTapped: () {},
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Row(
                    children: [
                      SizedBox(width: 12),
                      SimpleText(text: "Mes informations personnelles"),
                    ],
                  ),
                ),
                const TextBox(label: "Prénom", isPassword: false),
                const SizedBox(height: 20),
                const TextBox(label: "Nom", isPassword: false),
                const SizedBox(height: 20),
                const TextBox(label: "Adresse email", isPassword: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
