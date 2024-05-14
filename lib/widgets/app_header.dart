import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50),
      const SizedBox(
        height: 100,
        width: 100,
        child: Image(
          image: AssetImage("assets/images/logo_1_heaven_of_dice.png"),
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title ?? "",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    ]);
  }
}
