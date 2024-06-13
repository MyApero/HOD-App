import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/features/poles/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class CharacteristicsPersonnalisationScreen extends StatefulWidget {
  const CharacteristicsPersonnalisationScreen(
      {super.key, required this.cardName, required this.cardId});

  static route({required String id, required String name}) => MaterialPageRoute(
      builder: (ctx) =>
          CharacteristicsPersonnalisationScreen(cardId: id, cardName: name));

  final String cardName;
  final String cardId;

  @override
  State<CharacteristicsPersonnalisationScreen> createState() =>
      _CharacteristicsPersonnalisationScreenState();
}

class _CharacteristicsPersonnalisationScreenState
    extends State<CharacteristicsPersonnalisationScreen> {
  List<String> newKeys = [];
  List<String> newValues = [];
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

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
            SimpleText("Mes caractéristiques"),
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
                                  i <
                                          roleCard[0]
                                              .characteristics
                                              .characteristics
                                              .length &&
                                      i <
                                          roleCard[0]
                                              .characteristics
                                              .values
                                              .length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: HodFormField(
                                      label: "Caractéristique ${i + 1}",
                                      initialValue: roleCard[0]
                                          .characteristics
                                          .characteristics[i],
                                      onChanged: (value) {
                                        roleCard[0]
                                            .characteristics
                                            .characteristics[i] = value;
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
                                i <
                                        roleCard[0]
                                            .characteristics
                                            .characteristics
                                            .length &&
                                    i <
                                        roleCard[0]
                                            .characteristics
                                            .values
                                            .length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: HodFormField(
                                    label: "Valeur ${i + 1}",
                                    initialValue:
                                        roleCard[0].characteristics.values[i],
                                    onChanged: (value) {
                                      roleCard[0].characteristics.values[i] =
                                          value;
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
              label: "Créer une nouvelle caractéristique",
              icon: Icons.add,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actionsPadding: EdgeInsets.all(15),
                      title: const SimpleText(
                          "Veuillez renseignez les infos sur votre caractéristique"),
                      actions: [
                        HodFormField(label: "Nom", controller: keyController),
                        HodFormField(
                            label: "Valeur", controller: valueController),
                        TextButton(
                          child: const Text("Confirmer"),
                          onPressed: () {
                            setState(() {
                              roleCard[0]
                                  .characteristics
                                  .characteristics
                                  .add(keyController.text);
                              roleCard[0]
                                  .characteristics
                                  .values
                                  .add(valueController.text);

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
