import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/apis/poll_api.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';

class CreatePollScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (ctx) => const CreatePollScreen());
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _pollNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _optionControllers = [];

  bool _isLoading = false;

  int _numberOfOptions = 2;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _numberOfOptions; i++) {
      _optionControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: "Créer un sondage",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            HodFormField(
              label: "Votre question",
              controller: _questionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez entrer une question";
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _numberOfOptions; i++)
                      HodFormField(
                        label: "Réponse ${i + 1}",
                        controller: _optionControllers[i],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer une option";
                          }
                          return null;
                        },
                      ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HodButton(
                    label: "Ajouter une réponse",
                    textFontSize: 15,
                    onTapped: () {
                      setState(() {
                        _numberOfOptions++;
                        _optionControllers.add(TextEditingController());
                      });
                    },
                  ),
                ),
                if (_numberOfOptions > 0)
                  Expanded(
                    child: HodButton(
                      label: "Retirer la dernière réponse",
                      textFontSize: 13,
                      onTapped: () {
                        setState(() {
                          _numberOfOptions--;
                          _optionControllers.removeLast();
                        });
                      },
                    ),
                  )
              ],
            ),
            HodButton(
              label: "Créer",
              isLoading: _isLoading,
              onTapped: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  await PollApi.createPoll(
                    context: context,
                    username: _pseudoController.text,
                    name: _pollNameController.text,
                    password: _passwordController.text.isEmpty
                        ? null
                        : _passwordController.text,
                    createdAt: DateTime.now(),
                    createdBy: AuthApi.currentUser!.uid,
                    question: _questionController.text,
                    options: _optionControllers.map((e) => e.text).toList(),
                  );
                  setState(() {
                    _isLoading = false;
                  });
                  if (context.mounted) Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
