import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/apis/poll_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/select_button_outlined.dart';

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
  bool _multipleChoice = false;

  int _numberOfOptions = 2;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _numberOfOptions; i++) {
      _optionControllers.add(TextEditingController());
    }
    _pseudoController.text = AuthApi.currentUser!.displayName ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: "Créer un sondage",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HodFormField(
              label: "Pseudo",
              controller: _pseudoController,
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
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < _numberOfOptions; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: HodFormField(
                            label: "Réponse ${i + 1}",
                            controller: _optionControllers[i],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Veuillez entrer une option";
                              }
                              return null;
                            },
                          ),
                        ),
                        if (_numberOfOptions > 1)
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _optionControllers.removeAt(i);
                                  _numberOfOptions--;
                                });
                              },
                              icon: const FaIcon(FontAwesomeIcons.trash)),
                      ],
                    ),
                  SelectButtonOutlined(
                      label: "Ajouter une réponse",
                      icon: Icons.add,
                      onPressed: () {
                        setState(() {
                          _numberOfOptions++;
                          _optionControllers.add(TextEditingController());
                        });
                      }),
                ],
              ),
            ),
            SwitchListTile.adaptive(
              title: const Text("Choix multiples"),
              value: _multipleChoice,
              onChanged: (newValue) {
                setState(() {
                  _multipleChoice = newValue;
                });
              },
            ),
            HodButton(
              label: "Créer",
              isLoading: _isLoading,
              onTapped: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  final bool eventCreated = await PollApi.createPoll(
                    context: context,
                    username: _pseudoController.text,
                    name: _pollNameController.text,
                    password: _passwordController.text == ""
                        ? ""
                        : CryptConst.hashPassword(_passwordController.text),
                    createdAt: DateTime.now(),
                    createdBy: AuthApi.currentUser!.uid,
                    question: _questionController.text,
                    options: _optionControllers.map((e) => e.text).toList(),
                    multipleChoice: _multipleChoice,
                  );
                  setState(() {
                    _isLoading = false;
                  });
                  if (eventCreated && context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
