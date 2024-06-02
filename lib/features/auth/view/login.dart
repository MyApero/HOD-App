import 'package:flutter/material.dart';
import 'package:hod_app/features/auth/view/register.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/small_text.dart';
import 'package:hod_app/widgets/auth_field.dart';

class LoginScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        title: "Me connecter",
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(color: Colors.transparent, height: 70),
              Column(
                children: [
                  const AuthField(label: "Email"),
                  const SizedBox(height: 30),
                  AuthField(
                    label: "Mot de passe",
                    controller: emailController,
                  ),
                  const SizedBox(height: 30),
                  Container(
                      padding: const EdgeInsets.all(15),
                      child: HodButton(
                        label: "Me connecter",
                        onTapped: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      )),
                ],
              ),
              Column(
                children: [
                  const SmallClickableText("J'ai oublié mon mot de passe"),
                  const SizedBox(height: 10),
                  SmallClickableText("M'inscrire", onPressed: () {
                    Navigator.pushReplacement(context, RegisterScreen.route());
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
