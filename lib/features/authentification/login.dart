import 'package:flutter/material.dart';
import 'package:hod_app/features/authentification/register.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/small_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Container(
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
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
                // Container(
                //   padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
                //   child: TextField(
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontFamily: 'MulishSemiBold',
                //       color: Theme.of(context).colorScheme.surface,
                //     ),
                //     decoration: const InputDecoration(
                //       // fillColor: Theme.of(context).colorScheme.,
                //       labelText: 'Mot de passe', // Placeholder text
                //       border: OutlineInputBorder(), // Border style
                //     ),
                //   ),
                // ),
                // Container(
                //     padding: const EdgeInsets.all(15),
                //     child: HodButton(
                //       label: "Me connecter",
                //       onTapped: () {},
                //     )),
                // const SizedBox(height: 20),
                // const SmallText(title: "J'ai oublié mon mot de passe"),
                // const SizedBox(height: 20),
                // SmallText(
                //     title: "M'inscrire",
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const RegisterPage()));
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
