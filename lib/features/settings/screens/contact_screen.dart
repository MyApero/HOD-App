import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/constants/contacts.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => ContactScreen());

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
            SizedBox(height: 15),
            Row(
              children: [
                const SelectableText(
                    style: TextStyle(
                        fontFamily: HodFonts.coolvetica,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Palette.black),
                    "E-mail: ${ContactsConst.hodMail}"),
                Spacer(),
                FilledButton(
                  child: SimpleText("Copier", color: Palette.white),
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: ContactsConst.hodMail));
                    // copied successfully
                  },
                )
              ],
            )
          ],
        ));
  }
}
