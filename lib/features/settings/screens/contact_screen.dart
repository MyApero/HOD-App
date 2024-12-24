import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hod/constants/constants.dart';
import 'package:hod/constants/contacts.dart';
import 'package:hod/core/utils.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/theme/palette.dart';
import 'package:hod/widgets/select_button.dart';
import 'package:hod/widgets/simple_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => const ContactScreen());

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Contactez-nous",
        hasBackArrow: true,
        child: Column(
          children: [
            SelectButton(
              label: "Discord",
              onPressed: () {
                launchUrl(Uri.parse(ContactsConst.hodDiscordLink));
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SelectableText(
                    style: TextStyle(
                        fontFamily: HodFonts.coolvetica,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Palette.black),
                    "E-mail: ${ContactsConst.hodMail}"),
                const Spacer(),
                FilledButton(
                  child: const SimpleText("Copier", color: Palette.white),
                  onPressed: () async {
                    await Clipboard.setData(
                        const ClipboardData(text: ContactsConst.hodMail));
                    if (context.mounted) {
                      showSnackBar(context, "Adresse e-mail copiée");
                    }
                    // copied successfully
                  },
                )
              ],
            )
          ],
        ));
  }
}
