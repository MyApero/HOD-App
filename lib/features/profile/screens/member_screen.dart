import 'package:flutter/material.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/member_card.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

   static route() =>
      MaterialPageRoute(builder: (context) => const MemberScreen());

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      hasBackArrow: true,
      header: false,
      child: MemberCard(),
      // child: Placeholder(),
    );
  }
}
