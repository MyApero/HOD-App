import 'package:flutter/material.dart';
import 'package:hod_app/common/async_waiting.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/models/werewolf_role_model.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/simple_text.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key, required this.role});

  static route(WerewolfRoleModel role) => MaterialPageRoute(builder: (context) => RoleScreen(role: role));

  final WerewolfRoleModel role;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: role.name,
        hasBackArrow: true,
        child: Column(
          children: [
            Container(
                color: Palette.purple,
                padding: EdgeInsets.all(10),
                child: SimpleText(
                  role.message,
                  color: Palette.white,
                  textSize: 18,
                )),
            SizedBox(height: 20),
            Icon(
              role.icon,
              size: 100,
            ),
          ],
        ));
  }
}
