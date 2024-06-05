import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/player_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static route() => MaterialPageRoute(builder: (context) => ProfileScreen());

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        title: "Profil",
        hasBackArrow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [PlayerCard()],
        ));
  }
}
