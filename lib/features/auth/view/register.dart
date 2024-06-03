import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/features/auth/view/login.dart';
import 'package:hod_app/features/auth/widgets/cgu_checkbox.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:hod_app/widgets/auth_field.dart';
import 'package:hod_app/widgets/small_text.dart';

const double TEXT_FIELD_VERTICAL_MARGIN = 14;

class RegisterScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RegisterScreen());
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterScreen> {
  bool cguValue = false;

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

  void onRegister() {
    ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      body: AppBackground(
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
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        children: [
                          SizedBox(width: 12),
                          SimpleText("Mes informations personnelles"),
                        ],
                      ),
                    ),
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
                  ],
                ),
                const SizedBox(height: TEXT_FIELD_VERTICAL_MARGIN),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        children: [
                          SizedBox(width: 12),
                          SimpleText("Mon mot de passe"),
                        ],
                      ),
                    ),
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
                  ],
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
                        onRegister();
                      }
                    },
                    isLoading: isLoading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
