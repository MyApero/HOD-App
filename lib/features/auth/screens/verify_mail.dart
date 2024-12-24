import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod/apis/auth_api.dart';
import 'package:hod/features/navigation/view/navigation_pages.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/hod_button.dart';
import 'package:hod/widgets/simple_text.dart';

class VerifyMailScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const VerifyMailScreen());
  const VerifyMailScreen({super.key});

  @override
  State<VerifyMailScreen> createState() => _VerifyMailScreenState();
}

class _VerifyMailScreenState extends State<VerifyMailScreen> {
  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (FirebaseAuth.instance.currentUser != null) {
        FirebaseAuth.instance.currentUser!.reload();
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          Navigator.pushReplacement(context, NavigationPages.route());
          return false;
        }
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Regardez votre boîte mail",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SimpleText("Bonjour,"),
          SimpleText(
              "Un email de vérification a été envoyé à ${FirebaseAuth.instance.currentUser!.email}. (il devrait arriver dans moins de 10 minutes)"),
          const SimpleText(
              "Veuillez cliquer sur le lien dans l'email pour vérifier votre adresse."),
          const SimpleText(
              "Si vous n'avez pas reçu l'email, veuillez vérifier votre dossier spam."),
          const SimpleText(
              "Si vous avez besoin d'un nouvel email de vérification, veuillez cliquer sur le bouton ci-dessous."),
          const SimpleText("Bonne journée :)"),
          HodButton(
              label: "Recevoir un nouveau mail",
              onTapped: () {
                AuthApi.sendEmailVerification();
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: HodButton(
                label: "Se déconnecter",
                onTapped: () {
                  AuthApi.signOut();
                }),
          ),
        ],
      ),
    );
  }
}
