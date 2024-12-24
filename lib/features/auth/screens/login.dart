import 'package:flutter/material.dart';
import 'package:hod/apis/auth_api.dart';
import 'package:hod/features/auth/screens/register.dart';
import 'package:hod/features/auth/widgets/password_form_field.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/hod_button.dart';
import 'package:hod/widgets/hod_form_field.dart';
import 'package:hod/widgets/simple_text.dart';
import 'package:hod/widgets/small_text.dart';

class LoginScreen extends StatefulWidget {
  static route({bool? reauth}) => MaterialPageRoute(
      builder: (context) => LoginScreen(
            reauth: reauth ?? false,
          ));
  const LoginScreen({
    super.key,
    this.reauth = false,
  });

  final bool reauth;

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
      hasBackArrow: widget.reauth,
      title: widget.reauth
          ? "Reconnectez-vous pour supprimer votre compte"
          : "Me connecter",
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Column(
                children: [
                  HodFormField(
                    label: "Email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer un email";
                      }
                      return null;
                    },
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
                        onTapped: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            if (widget.reauth) {
                              final bool hasReauth = await AuthApi.reauth(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text);
                              if (hasReauth) {
                                Navigator.of(context).pop(true);
                              }
                            } else {
                              await AuthApi.login(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        isLoading: isLoading,
                      )),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  SmallClickableText(
                    "J'ai oublié mon mot de passe",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const SimpleText("Mot de passe oublié"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HodFormField(
                                  label: "Email", controller: emailController),
                              const SimpleText(
                                  "Le mail peut prendre quelque minutes à arriver."),
                            ],
                          ),
                          actions: [
                            HodButton(
                              label: "Envoyer",
                              onTapped: () async {
                                if (emailController.text.isNotEmpty) {
                                  bool mailSent = await AuthApi.resetPassword(
                                      context, emailController.text);
                                  if (mailSent && context.mounted) {
                                    Navigator.pop(context);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  if (!widget.reauth)
                    SmallClickableText("M'inscrire", onPressed: () {
                      Navigator.pushReplacement(
                          context, RegisterScreen.route());
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
