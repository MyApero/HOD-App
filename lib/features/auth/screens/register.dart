import 'package:flutter/material.dart';
import 'package:hod_app/features/auth/controller/auth_api.dart';
import 'package:hod_app/features/auth/screens/login.dart';
import 'package:hod_app/features/auth/widgets/cgu_checkbox.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/auth_field.dart';
import 'package:hod_app/widgets/small_text.dart';

const double TEXT_FIELD_VERTICAL_MARGIN = 14;

class RegisterScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RegisterScreen());
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  bool cguValue = false;

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "M'inscrire",
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SmallClickableText("Me connecter", onPressed: () {
                Navigator.pushReplacement(context, LoginScreen.route());
              }),
              const SizedBox(height: TEXT_FIELD_VERTICAL_MARGIN),
              AuthField(
                controller: firstNameController,
                label: "Prénom",
                validator: (name) {
                  if (name!.isEmpty) {
                    return "Veuillez entrer votre prénom";
                  }
                  return null;
                },
              ),
              const SizedBox(height: TEXT_FIELD_VERTICAL_MARGIN),
              AuthField(
                controller: nameController,
                label: "Nom",
                validator: (name) {
                  if (name!.isEmpty) return "Veuillez entrer votre nom";
                  return null;
                },
              ),
              const SizedBox(height: TEXT_FIELD_VERTICAL_MARGIN),
              AuthField(
                controller: emailController,
                label: "Adresse email",
                validator: (name) {
                  if (name!.isEmpty || !name.contains("@epitech.eu")) {
                    return "Veuillez entrer votre adresse mail epitech";
                  }
                  return null;
                },
              ),
              const SizedBox(height: TEXT_FIELD_VERTICAL_MARGIN),
              PasswordFormField(
                label: "Mot de passe",
                controller: passwordController,
              ),
              const SizedBox(height: TEXT_FIELD_VERTICAL_MARGIN),
              PasswordFormField(
                label: "Confirmation",
                controller: passwordConfirmationController,
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Les mots de passe ne correspondent pas";
                  }
                  return null;
                },
              ),
              FormField(
                validator: (value) {
                  if (!cguValue) return "Veuillez accepter les CGU";
                  return null;
                },
                builder: (fieldContext) => CguCheckbox(
                  value: cguValue,
                  onChanged: (value) {
                    setState(() {
                      cguValue = value;
                    });
                  },
                  hasError: fieldContext.hasError,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: HodButton(
                  label: "Créer mon compte",
                  onTapped: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      AuthApi.register(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                  isLoading: isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
