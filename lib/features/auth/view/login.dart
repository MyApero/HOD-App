import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/features/auth/view/register.dart';
import 'package:hod_app/features/auth/widgets/password_form_field.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/small_text.dart';
import 'package:hod_app/widgets/auth_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = ref.watch(authControllerProvider);
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
                  AuthField(
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
                            onLogin();
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
      ),
    );
  }
}
