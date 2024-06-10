import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';

class JoinPollScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => const JoinPollScreen());
  const JoinPollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: "Rejoindre un sondage",
      child: Column(
        children: [],
      ),
    );
  }
}
