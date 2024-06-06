import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/features/auth/screens/register.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/small_text.dart';

class LoginScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
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
    return AppScaffold(
      title: "Me connecter",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(color: Colors.transparent, height: 70),
            Column(
              children: [
                HodFormField(
                  label: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 30),
                PasswordFormField(
                  label: "Mot de passe",
                  controller: passwordController,
                ),
                const SizedBox(height: 30),
                Container(
                    padding: const EdgeInsets.all(15),
                    child: HodButton(
                      label: "Me connecter",
                      onTapped: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          AuthApi.login(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      isLoading: isLoading,
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
    );
  }
}
