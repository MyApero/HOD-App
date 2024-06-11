import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/apis/poll_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/features/poll/view/poll_screen.dart';
import 'package:hod_app/models/poll_model.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';

class JoinPollScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (ctx) => const JoinPollScreen());
  const JoinPollScreen({super.key});

  @override
  State<JoinPollScreen> createState() => _JoinPollScreenState();
}

class _JoinPollScreenState extends State<JoinPollScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _pollNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: "Rejoindre un sondage",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HodFormField(
              label: "Pseudo",
              controller: _pseudoController,
              initialValue: AuthApi.currentUser!.displayName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez entrer un pseudo";
                }
                return null;
              },
            ),
            HodFormField(
              label: "Nom du sondage",
              controller: _pollNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez entrer un nom de sondage";
                }
                return null;
              },
            ),
            PasswordFormField(
              label: "Mot de passe",
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            HodButton(
              label: "Rejoindre",
              onTapped: () async {
                if (_formKey.currentState!.validate()) {
                  PollModel? poll = await PollApi.getPoll(
                    pollName: _pollNameController.text,
                    password: _passwordController.text.isEmpty
                        ? null
                        : _passwordController.text,
                  );
                  if (poll == null && context.mounted) {
                    showSnackBar(context, 'Sondage introuvable');
                    return;
                  }
                  if (poll!.options.map((e) => e.voters).any((e) => e.contains(_pseudoController.text))) {
                    if (context.mounted) {
                      showSnackBar(context, 'Vous avez déjà voté');
                    }
                    return;
                  }
                  if (context.mounted) {
                    Navigator.of(context).push(
                      PollScreen.route(_pseudoController.text, poll!),
                    );
                  }

                  // transform the json poll to PollModel

                  // Navigate to the page with the founded poll and the username
                  // Navigator.of(context).push(JoinPollScreen);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
