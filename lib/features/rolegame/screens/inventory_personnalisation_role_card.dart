import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/features/rolegame/screens/personnalisation_role_card_screen.dart';
import 'package:hod_app/features/rolegame/screens/role_card_info_screen.dart';
import 'package:hod_app/features/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class InventoryPersonnalisationRoleCard extends StatefulWidget {
  const InventoryPersonnalisationRoleCard(
      {super.key, required this.cardName, required this.cardId});

  static route({required String id, required String name}) => MaterialPageRoute(
      builder: (ctx) =>
          InventoryPersonnalisationRoleCard(cardId: id, cardName: name));

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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i = 0;
                                i < roleCard[0].inventory.items.length &&
                                    i < roleCard[0].inventory.values.length;
                                i++)
                              HodFormField(
                                  label: "Item ${i + 1}",
                                  text: roleCard[0].inventory.items[i],
                                  onChanged: (value) {
                                    roleCard[0].inventory.items[i] = value;
                                  }),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var i = 0;
                              i < roleCard[0].inventory.items.length &&
                                  i < roleCard[0].inventory.values.length;
                              i++)
                            HodFormField(
                                label: "Valeur ${i + 1}",
                                text: roleCard[0].inventory.values[i],
                                onChanged: (value) {
                                  roleCard[0].inventory.values[i] = value;
                                })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SelectButton(
              label: "Créer un nouvel item",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
