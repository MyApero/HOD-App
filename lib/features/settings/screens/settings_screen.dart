import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/features/auth/screens/login.dart';
import 'package:hod_app/features/settings/screens/contact_screen.dart';
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
          icon: FontAwesomeIcons.arrowRight,
          onPressed: () => Navigator.of(context).push(ReportScreen.route()),
        ),
        SelectButton(
          label: "Contact",
          icon: FontAwesomeIcons.arrowRight,
          onPressed: () => Navigator.of(context).push(ContactScreen.route()),
        ),
        SelectButton(
          label: "Crédits",
          icon: FontAwesomeIcons.arrowRight,
          onPressed: () => Navigator.of(context).push(CreditScreen.route()),
        ),
        const Expanded(child: SizedBox()),
        SelectButton(
          label: "Déconnexion",
          icon: FontAwesomeIcons.arrowRight,
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
                title: const SimpleText(
                    "Voulez-vous vraiment supprimer votre compte ? Cette action est irréversible."),
                actions: [
                  TextButton(
                    child: const Text("Annuler"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                      child: const Text(
                        "Confirmer",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () async {
                        final bool? hasReconnect = await Navigator.of(context)
                            .push(LoginScreen.route(reauth: true)) as bool?;
                        if (hasReconnect == null || !hasReconnect) {
                          return;
                        }
                        AuthApi.deleteAccount(context);
                        Navigator.of(context).pop();
                      }),
                ],
              );
            },
          );
        })
      ],
    );
  }
}
