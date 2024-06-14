import 'package:flutter/material.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/member_card.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

   static route() =>
      MaterialPageRoute(builder: (context) => MemberScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      header: false,
      child: MemberCard(),
    );
  }
}