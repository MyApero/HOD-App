import 'package:flutter/material.dart';
import 'package:hod_app/widgets/hod_logo.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HodLogo(),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title ?? "NO TEXT",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    ]);
  }
}
