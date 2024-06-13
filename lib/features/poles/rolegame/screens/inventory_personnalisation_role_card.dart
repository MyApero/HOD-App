import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/features/poles/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class InventoryPersonnalisationRoleCard extends StatefulWidget {
  static route({required String id, required String name}) => MaterialPageRoute(
      builder: (ctx) =>
          InventoryPersonnalisationRoleCard(cardId: id, cardName: name));

  const InventoryPersonnalisationRoleCard(
      {super.key, required this.cardName, required this.cardId});

  final String cardName;
  final String cardId;

  @override
  State<InventoryPersonnalisationRoleCard> createState() =>
      _InventoryPersonnalisationRoleCardState();
}

class _InventoryPersonnalisationRoleCardState
    extends State<InventoryPersonnalisationRoleCard> {
  List<String> newKeys = [];
  List<String> newValues = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: widget.cardName,
      child: RoleCardData(
        idFilter: widget.cardId,
        builder: (roleCard) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText("Mes items"),
            SizedBox(height: 5),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0;
                                  i < roleCard[0].inventory.items.length &&
                                      i < roleCard[0].inventory.values.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: HodFormField(
                                      label: "Item ${i + 1}",
                                      initialValue:
                                          roleCard[0].inventory.items[i],
                                      onChanged: (value) {
                                        roleCard[0].inventory.items[i] = value;
                                      }),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                                i < roleCard[0].inventory.items.length &&
                                    i < roleCard[0].inventory.values.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: HodFormField(
                                    keyboardType: TextInputType.number,
                                    label: "Valeur ${i + 1}",
                                    initialValue:
                                        roleCard[0].inventory.values[i],
                                    onChanged: (value) {
                                      roleCard[0].inventory.values[i] = value;
                                    }),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SelectButton(
              label: "Actualiser",
              onPressed: () {
                RoleCardApi.updateRoleCard(
                    context: context, roleCard: roleCard[0]);
              },
            ),
            SizedBox(height: 10),
            SelectButton(
              label: "Créer un nouvel item",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actionsPadding: EdgeInsets.all(15),
                      title: const SimpleText(
                          "Veuillez renseignez les infos sur votre item"),
                      actions: [
                        HodFormField(label: "Nom", controller: nameController),
                        HodFormField(
                            keyboardType: TextInputType.number,
                            label: "Quantité",
                            controller: quantityController),
                        TextButton(
                          child: const Text("Confirmer"),
                          onPressed: () {
                            setState(() {
                              roleCard[0]
                                  .inventory
                                  .items
                                  .add(nameController.text);
                              roleCard[0]
                                  .inventory
                                  .values
                                  .add(quantityController.text);

                              RoleCardApi.updateRoleCard(
                                  context: context, roleCard: roleCard[0]);
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
