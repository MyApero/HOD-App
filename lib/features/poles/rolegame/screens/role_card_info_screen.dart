import 'package:flutter/material.dart';
import 'package:hod/apis/role_card_api.dart';
import 'package:hod/features/poles/rolegame/screens/characteristics_personnalisation_screen.dart';
import 'package:hod/features/poles/rolegame/screens/inventory_personnalisation_role_card.dart';
import 'package:hod/features/poles/rolegame/screens/personnalisation_role_card_screen.dart';
import 'package:hod/features/poles/rolegame/widgets/role_card_game_data.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/player_card.dart';
import 'package:hod/widgets/select_button.dart';
import 'package:hod/widgets/simple_text.dart';
import 'package:hod/widgets/small_text.dart';

class RoleCardInfoScreen extends StatefulWidget {
  static route({required String id, required String name}) => MaterialPageRoute(
      builder: (ctx) => RoleCardInfoScreen(cardName: name, cardId: id));

  const RoleCardInfoScreen(
      {super.key, required this.cardName, required this.cardId});

  final String cardName;
  final String cardId;

  @override
  State<RoleCardInfoScreen> createState() => _RoleCardInfoScreenState();
}

class _RoleCardInfoScreenState extends State<RoleCardInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: widget.cardName,
      child: RoleCardData(
        idFilter: widget.cardId,
        builder: (roleCard) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerCard(
                keys: roleCard[0].keys,
                values: roleCard[0].values,
                male: true,
                roleCardId: widget.cardId,
              ),
              const SizedBox(height: 10),
              SelectButton(
                  label: "Personnaliser ma carte",
                  onPressed: () async {
                    await Navigator.of(context).push(
                        PersonnalisationRoleCardScreen.route(
                            id: widget.cardId, name: widget.cardName));
                    setState(() {});
                  }),
              const SizedBox(height: 10),
              SelectButton(
                label: "Mes caractéristiques",
                onPressed: () => Navigator.of(context).push(
                    CharacteristicsPersonnalisationScreen.route(
                        name: widget.cardName, id: widget.cardId)),
              ),
              const SizedBox(height: 10),
              SelectButton(
                label: "Mon inventaire",
                onPressed: () => Navigator.of(context).push(
                    InventoryPersonnalisationRoleCard.route(
                        name: widget.cardName, id: widget.cardId)),
              ),
              SmallClickableText("Supprimer le personnage", color: Colors.red,
                  onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const SimpleText(
                          "Voulez-vous vraiment supprimer votre personnage ? Cette action est irréversible."),
                      actions: [
                        TextButton(
                          child: const Text("Annuler"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                            child: const Text(
                              "Confirmer",
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () async {
                              await RoleCardApi.deleteRoleCard(
                                  context: context, id: widget.cardId);
                              if (context.mounted) {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              }
                            }),
                      ],
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
