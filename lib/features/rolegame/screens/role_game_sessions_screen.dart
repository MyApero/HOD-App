import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/features/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/models/role_card_model.dart';
import 'package:hod_app/models/role_characteristics_model.dart';
import 'package:hod_app/models/role_inventory_model.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/select_button.dart';

class RoleGameSessionsScreen extends StatelessWidget {
  const RoleGameSessionsScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => RoleGameSessionsScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Personnages",
        hasBackArrow: true,
        child: RoleCardData(
          builder: (roleCards) => Column(
            children: [
              ...roleCards.map(
                (e) => SelectButton(
                  label: e.name,
                  icon: Icons.arrow_circle_right_outlined,
                  onPressed: () {},
                ),
              ),
              SelectButton(
                label: "Créer un nouveau personnage",
                onPressed: () {
                  RoleCardApi.addRoleCard(
                    context: context,
                    roleCard: RoleCardModel(
                      name: "oui",
                      keys: ["", "", "", "", "", ""],
                      values: ["", "", "", "", "", ""],
                      inventory: RoleInventoryModel(items: [], values: []),
                      characteristics: RoleCharacteristicsModel(
                          characteristics: [], values: []),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
