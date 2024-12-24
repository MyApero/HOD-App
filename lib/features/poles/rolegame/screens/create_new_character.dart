import 'package:flutter/material.dart';
import 'package:hod/apis/role_card_api.dart';
import 'package:hod/models/role_card_model.dart';
import 'package:hod/models/role_characteristics_model.dart';
import 'package:hod/models/role_inventory_model.dart';
import 'package:hod/widgets/hod_form_field.dart';
import 'package:hod/widgets/simple_text.dart';

Future<bool> showCreateNewCharacter(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      final TextEditingController characterNameController =
          TextEditingController();

      return AlertDialog(
        actionsPadding: const EdgeInsets.all(10),
        title:
            const SimpleText("Veuillez renseigner le nom de votre personnage"),
        actions: [
          HodFormField(
              label: "Nom du personnage", controller: characterNameController),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Annuler"),
              ),
              const Spacer(),
              TextButton(
                child: const Text("Confirmer"),
                onPressed: () async {
                  await RoleCardApi.addRoleCard(
                    context: context,
                    roleCard: RoleCardModel(
                      name: characterNameController.text,
                      url: "",
                      keys: ["", "", "", "", "", ""],
                      values: ["", "", "", "", "", ""],
                      inventory: RoleInventoryModel(items: [], values: []),
                      characteristics: RoleCharacteristicsModel(
                          characteristics: [], values: []),
                    ),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );
    },
  );
  return true;
}
