import 'package:flutter/material.dart';
import 'package:hod/constants/role_list.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/features/poles/werewolf/screens/role_screen.dart';
import 'package:hod/widgets/select_button.dart';

class MainRoleScreen extends StatelessWidget {
  const MainRoleScreen({super.key});

  static route() => MaterialPageRoute(builder: (context) => MainRoleScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Rôles",
      hasBackArrow: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...roleList.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SelectButton(
                  label: e.name,
                  icon: e.icon,
                  onPressed: () {
                    Navigator.of(context).push(RoleScreen.route(e));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
