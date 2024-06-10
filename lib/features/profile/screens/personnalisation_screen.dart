import 'package:flutter/material.dart';
import 'package:hod_app/apis/player_card_api.dart';
import 'package:hod_app/features/profile/widget/player_card_data.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class PersonnalisationScreen extends StatelessWidget {
  const PersonnalisationScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => PersonnalisationScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Personnaliser ma carte",
      hasBackArrow: true,
      child: PlayerCardData(
        builder: (playerCard) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText("Mes informations"),
            Expanded(
              child: Container(
                // color: Colors.red,
                // height: double.infinity,
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
                            for (var i = 0; i < 6; i++)
                              HodFormField(
                                  label: "Catégorie ${i + 1}",
                                  initialValue: playerCard.keys[i],
                                  onChanged: (value) {
                                    playerCard.keys[i] = value;
                                  }),
                            // ...playerCard.keys.map(
                            //   (e) => HodFormField(label: e),
                            // ),
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
                          for (var i = 0; i < 6; i++)
                            HodFormField(
                                label: "Valeur ${i + 1}",
                                initialValue: playerCard.values[i],
                                onChanged: (value) {
                                  playerCard.values[i] = value;
                                })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SelectButton(
              label: "Confirmer",
              onPressed: () {
                PlayerCardApi.updatePlayerCard(
                    context: context, playerCard: playerCard);
              },
            )
          ],
        ),
      ),
    );
  }
}
