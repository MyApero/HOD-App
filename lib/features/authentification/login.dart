import 'package:flutter/material.dart';
import 'package:hod_app/features/authentification/register.dart';
import 'package:hod_app/widgets/hod_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 100, 15, 20),
          child: TextField(
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'MulishSemiBold',
              color: Theme.of(context).colorScheme.surface,
            ),
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
          child: TextField(
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'MulishSemiBold',
              color: Theme.of(context).colorScheme.surface,
            ),
            decoration: const InputDecoration(
              // fillColor: Theme.of(context).colorScheme.,
              labelText: 'Mot de passe', // Placeholder text
              border: OutlineInputBorder(), // Border style
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(15),
            child: HodButton(
              label: "Me connecter",
              onTapped: () {},
            )),
        TextButton(
            onPressed: () {},
            child: const Text("J'ai oublié mon mot de passe",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'MulishSemiBold',
                  color: Color(0xFFAEAED7),
                ))),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            },
            child: const Text("M'inscrire",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'MulishSemiBold',
                  color: Color(0xFFAEAED7),
                ))),
      ]),
    );
  }
}