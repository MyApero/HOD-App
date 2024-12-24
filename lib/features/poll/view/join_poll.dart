import 'package:flutter/material.dart';
import 'package:hod/apis/auth_api.dart';
import 'package:hod/apis/poll_api.dart';
import 'package:hod/constants/constants.dart';
import 'package:hod/core/utils.dart';
import 'package:hod/features/auth/widgets/password_form_field.dart';
import 'package:hod/features/poll/view/poll_screen.dart';
import 'package:hod/models/poll_model.dart';
import 'package:hod/widgets/hod_button.dart';
import 'package:hod/widgets/hod_form_field.dart';

class JoinPollScreen extends StatefulWidget {
  static route(String pollName) =>
      MaterialPageRoute(builder: (ctx) => JoinPollScreen(pollName: pollName));
  const JoinPollScreen({super.key, required this.pollName});

  final String pollName;

  @override
  State<JoinPollScreen> createState() => _JoinPollScreenState();
}

class _JoinPollScreenState extends State<JoinPollScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void checkPollPassword(BuildContext context) async {
    PollModel? poll = await PollApi.getPoll(
      pollName: widget.pollName,
      password: CryptConst.hashPassword(_passwordController.text),
    );
    if (poll != null && context.mounted) {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        PollScreen.route(_pseudoController.text, poll),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pseudoController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pseudoController.text = AuthApi.currentUser!.displayName ?? "";

    checkPollPassword(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Rejoindre ${widget.pollName}"),
      actions: [
        HodButton(
          label: "Rejoindre",
          onTapped: () async {
            if (_formKey.currentState!.validate()) {
              PollModel? poll = await PollApi.getPoll(
                pollName: widget.pollName,
                password: CryptConst.hashPassword(_passwordController.text),
              );
              if (poll == null && context.mounted) {
                showSnackBar(context, 'Mauvais mot de passe');
                return;
              }
              if (context.mounted) {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  PollScreen.route(_pseudoController.text, poll!),
                );
              }
            }
          },
        ),
      ],
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            HodFormField(
              label: "Pseudo (pour le sondage)",
              controller: _pseudoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez entrer un pseudo";
                }
                return null;
              },
            ),
            PasswordFormField(
              label: "Mot de passe (du sondage)",
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
