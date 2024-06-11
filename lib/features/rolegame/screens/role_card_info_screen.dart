import 'package:flutter/material.dart';
import 'package:hod_app/features/profile/screens/personnalisation_screen.dart';
import 'package:hod_app/features/rolegame/screens/characteristics_personnalisation_screen.dart';
import 'package:hod_app/features/rolegame/screens/inventory_personnalisation_role_card.dart';
import 'package:hod_app/features/rolegame/screens/personnalisation_role_card_screen.dart';
import 'package:hod_app/features/rolegame/widgets/role_card_game_data.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/player_card.dart';
import 'package:hod_app/widgets/select_button.dart';

class RoleCardInfoScreen extends StatelessWidget {
  const RoleCardInfoScreen(
      {super.key, required this.cardName, required this.cardId});

  final String cardName;
  final String cardId;

  static route({required String id, required String name}) => MaterialPageRoute(
      builder: (ctx) => RoleCardInfoScreen(cardName: name, cardId: id));

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: cardName,
        child: RoleCardData(
          idFilter: cardId,
          builder: (roleCard) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PlayerCard(keys: roleCard[0].keys, values: roleCard[0].values),
                SelectButton(
                  label: "Personnaliser ma carte",
                  onPressed: () => Navigator.of(context).push(
                      PersonnalisationRoleCardScreen.route(
                          id: cardId, name: cardName)),
                ),
                SelectButton(
                  label: "Mes caractéristiques",
                  onPressed: () => Navigator.of(context).push(
                      CharacteristicsPersonnalisationScreen.route(
                          name: cardName, id: cardId)),
                ),
                SelectButton(
                  label: "Mon inventaire",
                  onPressed: () => Navigator.of(context).push(
                      InventoryPersonnalisationRoleCard.route(
                          name: cardName, id: cardId)),
                ),
                // SelectButton(label: "Personnalisation",
                // onPressed: () {
                // Navigator.of(context).push(PersonnalisationScreen.route());
                // }, icon: Icons.arrow_circle_right_outlined),
              ]),
        ));
  }
}
