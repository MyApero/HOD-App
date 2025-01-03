import 'package:flutter/material.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/models/werewolf_role_model.dart';
import 'package:hod/theme/palette.dart';
import 'package:hod/widgets/simple_text.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key, required this.role});

  static route(WerewolfRoleModel role) =>
      MaterialPageRoute(builder: (context) => RoleScreen(role: role));

  final WerewolfRoleModel role;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: role.name,
        hasBackArrow: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                color: Palette.purple,
                padding: const EdgeInsets.all(10),
                child: SimpleText(
                  role.message,
                  color: Palette.white,
                  textSize: 20,
                )),
            const SizedBox(height: 20),
            Icon(
              color: Palette.purple,
              role.icon,
              size: 130,
            ),
          ],
        ));
  }
}
