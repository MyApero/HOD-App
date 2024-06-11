import 'package:flutter/material.dart';
import 'package:hod_app/apis/player_card_api.dart';
import 'package:hod_app/features/profile/widget/player_card_data.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                // color: Colors.red,
                // height: double.infinity,
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
                                      initialValue: playerCard.keys[i],
                                      onChanged: (value) {
                                        playerCard.keys[i] = value;
                                      }),
                                ),
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: HodFormField(
                                    label: "Valeur ${i + 1}",
                                    initialValue: playerCard.values[i],
                                    onChanged: (value) {
                                      playerCard.values[i] = value;
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
            HodButton(
              label: "Confirmer",
              onTapped: () {
                PlayerCardApi.updatePlayerCard(
                    context: context, playerCard: playerCard);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
