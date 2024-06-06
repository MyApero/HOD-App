import 'package:flutter/material.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      //color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
            width: double.infinity,
            height: 285,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  const Text(
                    "Carte de \"Status\"",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    // color: Colors.yellow,
                    child: Container(
                      // color: Colors.red,
                      width: double.infinity,
                      height: 170,
                      child: Row(
                        children: [
                          Container(
                            // color: Colors.purple,
                            width: 180,
                            child: const Column(
                              children: [
                                PlayerCardItem(
                                  fieldKey: "N°ID",
                                  fieldValue: "4721",
                                ),
                                PlayerCardItem(
                                    fieldKey: "Pseudo", fieldValue: "sambrus"),
                                SizedBox(height: 14),
                                PlayerCardItem(
                                  fieldKey: "Status",
                                  fieldValue: "Membre",
                                ),
                                PlayerCardItem(
                                    fieldKey: "Score",
                                    fieldValue: "100000000000"),
                                SizedBox(height: 14),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
                            width: 120,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Color(0xFFE3E3F1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Image.network('https://archives.bulbagarden.net/media/upload/6/6c/Spr_B2W2_Iris.png',
                    ),
                          ),
                        ],
                      ),
                    ),
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
