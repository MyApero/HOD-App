import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/features/settings/screens/credit_screen.dart';
import 'package:hod_app/features/settings/screens/report_screen.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:hod_app/widgets/small_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SelectButton(
          label: "Faire un retour",
          icon: Icons.arrow_circle_right_outlined,
          onPressed: () => Navigator.of(context).push(ReportScreen.route()),
        ),
        const SelectButton(
            label: "Contact", icon: Icons.arrow_circle_right_outlined),
        SelectButton(
          label: "Crédits",
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
        SmallClickableText("Supprimer le compte", color: Colors.red,
            onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const SimpleText("Voulez-vous vraiment supprimer votre compte ? Cette action est irréversible."),
                actions: [
                  TextButton(
                    child: const Text("Annuler"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    child: const Text("Confirmer"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      AuthApi.deleteAccount(context);
                    }
                  ),
                ],
              );
            },
          );
        })
      ],
    );
  }
}
