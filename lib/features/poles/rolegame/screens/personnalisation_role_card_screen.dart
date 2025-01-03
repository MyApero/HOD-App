import 'package:flutter/material.dart';
import 'package:hod/apis/role_card_api.dart';
import 'package:hod/features/poles/rolegame/widgets/role_card_game_data.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/hod_form_field.dart';
import 'package:hod/widgets/select_button.dart';
import 'package:hod/widgets/simple_text.dart';

class PersonnalisationRoleCardScreen extends StatelessWidget {
  const PersonnalisationRoleCardScreen(
      {super.key, required this.cardName, required this.cardId});

  static route({required String id, required String name}) => MaterialPageRoute(
      builder: (ctx) =>
          PersonnalisationRoleCardScreen(cardName: name, cardId: id));

  final String cardName;
  final String cardId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Personnaliser la carte de $cardName",
      hasBackArrow: true,
      child: RoleCardData(
        idFilter: cardId,
        builder: (roleCard) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SimpleText("Mes informations"),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (var i = 0; i < 6; i++)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: HodFormField(
                                      label: "Catégorie ${i + 1}",
                                      initialValue: roleCard[0].keys[i],
                                      onChanged: (value) {
                                        roleCard[0].keys[i] = value;
                                      }),
                                ),
                              // ...playerCard.keys.map(
                              //   (e) => HodFormField(label: e),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i = 0; i < 6; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: HodFormField(
                                    label: "Valeur ${i + 1}",
                                    initialValue: roleCard[0].values[i],
                                    onChanged: (value) {
                                      roleCard[0].values[i] = value;
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
              label: "Confirmer",
              onPressed: () {
                RoleCardApi.updateRoleCard(
                    context: context, roleCard: roleCard[0]);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
