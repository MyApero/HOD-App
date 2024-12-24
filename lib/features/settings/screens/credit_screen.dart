import 'package:flutter/material.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/simple_text.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => CreditScreen());

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Crédits",
      hasBackArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SimpleText(
            "Equipe de développement :",
            textSize: 25,
          ),
          SimpleText(
            "Développeurs full stack: Antoine Esman, Samuel Bruschet",
            textSize: 15,
          ),
          SimpleText(
            "Design :",
            textSize: 25,
          ),
          SimpleText(
            "UI/UX Designers: Cyprien Diederichs",
            textSize: 15,
          ),
          SimpleText(
            "Chef de projet :",
            textSize: 25,
          ),
          SimpleText(
            "Chef de projet: Matthias von Rakowski",
            textSize: 15,
          ),
        ],
      ),
    );
  }
}
