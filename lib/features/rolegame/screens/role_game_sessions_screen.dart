import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/features/rolegame/screens/role_card_info_screen.dart';
import 'package:hod_app/features/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/models/role_card_model.dart';
import 'package:hod_app/models/role_characteristics_model.dart';
import 'package:hod_app/models/role_inventory_model.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class RoleGameSessionsScreen extends StatelessWidget {
  RoleGameSessionsScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => RoleGameSessionsScreen());

  TextEditingController characterNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Personnages",
      hasBackArrow: true,
      child: RoleCardData(
        builder: (roleCards) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...roleCards.map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SelectButton(
                      label: e.name,
                      icon: Icons.arrow_circle_right_outlined,
                      onPressed: () => Navigator.of(context).push(
                          RoleCardInfoScreen.route(name: e.name, id: e.id!)),
                    ),
                  ),
                ),
                SelectButton(
                  label: "Créer un nouveau personnage",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsPadding: EdgeInsets.all(10),
                          title: const SimpleText(
                              "Veuillez renseigner le nom de votre personnage"),
                          actions: [
                            HodFormField(
                                label: "Nom du personnage",
                                controller: characterNameController),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Annuler"),
                                ),
                                Spacer(),
                                TextButton(
                                  child: const Text("Confirmer"),
                                  onPressed: () {
                                    RoleCardApi.addRoleCard(
                                      context: context,
                                      roleCard: RoleCardModel(
                                        name: characterNameController.text,
                                        keys: ["", "", "", "", "", ""],
                                        values: ["", "", "", "", "", ""],
                                        inventory: RoleInventoryModel(
                                            items: [], values: []),
                                        characteristics:
                                            RoleCharacteristicsModel(
                                                characteristics: [],
                                                values: []),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                    print("je suis censé me fermer");
                                  },
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
