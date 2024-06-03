import 'package:flutter/material.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      //color: Theme.of(context).colorScheme.primary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
            width: double.infinity,
            height: 320,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Column(
                children: [
                  const Text(
                    "Carte de \"Status\"",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        // color: Colors.red,
                        width: 300,
                        height: 200,
                        child: Row(
                          children: [
                            Container(
                              // color: Colors.yellow,
                              height: 200,
                              width: 220,
                              child: const Column(
                                children: [
                                  PlayerCardItem(
                                    fieldKey: "N°ID",
                                    fieldValue: "4721",
                                  ),
                                  PlayerCardItem(
                                      fieldKey: "Pseudo",
                                      fieldValue: "sambrus"),
                                  SizedBox(height: 18),
                                  PlayerCardItem(
                                    fieldKey: "Status",
                                    fieldValue: "Membre",
                                  ),
                                  PlayerCardItem(
                                      fieldKey: "Score",
                                      fieldValue: "100000000000"),
                                  SizedBox(height: 18),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.red,
                              height: 200,
                              width: 250,
                              child: Text("salut bonsoir"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PlayerCardItem(fieldKey: "Duree de jeu", fieldValue: "1000h"),
                  PlayerCardItem(
                      fieldKey: "Debut de l'aventure",
                      fieldValue: "20/04/2024"),
                ],
              ),
            )),
      ),
    );
  }
}
