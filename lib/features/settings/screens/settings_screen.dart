import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/features/settings/screens/credit_screen.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/small_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SelectButton(
            label: "Faire un retour", icon: Icons.arrow_circle_right_outlined),
        const SelectButton(
            label: "Contact", icon: Icons.arrow_circle_right_outlined),
        SelectButton(
          label: "Crédit",
          icon: Icons.arrow_circle_right_outlined,
          onPressed: () => Navigator.of(context).push(CreditScreen.route()),
        ),
        SelectButton(
          label: "Déconnexion",
          icon: Icons.arrow_circle_right_outlined,
          color: const Color(0xFFE43333),
          onPressed: () {
            AuthApi.signOut();
          },
        ),
        const SmallClickableText("Supprimer le compte", color: Colors.red)
      ],
    );
  }
}
