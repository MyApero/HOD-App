import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Palette.purple,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text(
                    "Carte de Personnage",
                    style: TextStyle(
                      fontSize: 15,
                      color: Palette.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Expanded(
                        // color: Colors.purple,
                        child: Column(
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
                                fieldKey: "Score", fieldValue: "100000000000"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE3E3F1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Image.network(
                            fit: BoxFit.cover,
                            'https://archives.bulbagarden.net/media/upload/6/6c/Spr_B2W2_Iris.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const PlayerCardItem(
                      fieldKey: "Duree de jeu", fieldValue: "1000h"),
                  const PlayerCardItem(
                      fieldKey: "Debut de l'aventure",
                      fieldValue: "20/04/2024"),
                ],
              ),
            )),
      ),
    );
  }
}
