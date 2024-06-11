import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(
      {super.key,
      required this.keys,
      required this.values,
      this.roleCard = false});

  final List<String> keys;
  final List<String> values;
  final bool roleCard;

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
                      Expanded(
                        // color: Colors.purple,
                        child: Column(
                          children: [
                            PlayerCardItem(
                              fieldKey: keys[0],
                              fieldValue: values[0],
                            ),
                            PlayerCardItem(
                                fieldKey: keys[1], fieldValue: values[1]),
                            const SizedBox(height: 14),
                            PlayerCardItem(
                              fieldKey: keys[2],
                              fieldValue: values[2],
                            ),
                            PlayerCardItem(
                                fieldKey: keys[3], fieldValue: values[3]),
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
                          child: roleCard
                              ? null
                              : Image.network(
                                  errorBuilder:
                                      (context, exception, stackTrace) =>
                                          const Icon(Icons.network_wifi_1_bar),
                                  fit: BoxFit.cover,
                                  'https://archives.bulbagarden.net/media/upload/6/6c/Spr_B2W2_Iris.png',
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    if (wasSynchronouslyLoaded) {
                                      return child;
                                    }
                                    return AnimatedScale(
                                      scale: frame == null ? 0 : 1,
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.easeOut,
                                      child: child,
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress != null &&
                                        loadingProgress.expectedTotalBytes !=
                                            null) {
                                      CircularProgressIndicator(
                                          value: loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!);
                                    }
                                    return child;
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  PlayerCardItem(fieldKey: keys[4], fieldValue: values[4]),
                  PlayerCardItem(fieldKey: keys[5], fieldValue: values[5]),
                ],
              ),
            )),
      ),
    );
  }
}
