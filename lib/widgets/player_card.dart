import 'package:flutter/material.dart';
import 'package:hod_app/apis/player_card_api.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/models/player_card_model.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/player_card_item.dart';
import 'package:hod_app/widgets/simple_text.dart';

class PlayerCard extends StatefulWidget {
  PlayerCard(
      {super.key,
      required this.keys,
      required this.values,
      required this.male,
      this.roleCardId});

  final List<String> keys;
  final List<String> values;
  bool male;
  final String? roleCardId;
  final TextEditingController urlController = TextEditingController();

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
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
                              fieldKey: widget.keys[0],
                              fieldValue: widget.values[0],
                            ),
                            PlayerCardItem(
                                fieldKey: widget.keys[1],
                                fieldValue: widget.values[1]),
                            const SizedBox(height: 14),
                            PlayerCardItem(
                              fieldKey: widget.keys[2],
                              fieldValue: widget.values[2],
                            ),
                            PlayerCardItem(
                                fieldKey: widget.keys[3],
                                fieldValue: widget.values[3]),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10.0),
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE3E3F1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: widget.roleCardId != null
                              ? GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actionsPadding: EdgeInsets.all(15),
                                          title: const SimpleText(
                                              "Veuillez saisir une URL pour votre image"),
                                          actions: [
                                            HodFormField(
                                                label: "URL",
                                                controller:
                                                    widget.urlController),
                                            TextButton(
                                              child: const Text("Confirmer"),
                                              onPressed: () async {
                                                print("ouiii");
                                                await RoleCardApi
                                                    .updateRoleCardImage(
                                                        widget.roleCardId!,
                                                        widget.urlController
                                                            .text);
                                                if (context.mounted) {
                                                  Navigator.of(context).pop();
                                                }

                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: FutureBuilder(
                                    future: RoleCardApi.getRoleCardImage(
                                        widget.roleCardId!),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      }
                                      if (!snapshot.hasData) {
                                        return Text("No photo");
                                      }
                                      return Image.network(
                                        errorBuilder:
                                            (context, exception, stackTrace) =>
                                                const Icon(
                                                    Icons.network_wifi_1_bar),
                                        fit: BoxFit.,
                                        snapshot.data!,
                                        frameBuilder: (context, child, frame,
                                            wasSynchronouslyLoaded) {
                                          if (wasSynchronouslyLoaded) {
                                            return child;
                                          }
                                          return AnimatedScale(
                                            scale: frame == null ? 0 : 1,
                                            duration:
                                                const Duration(seconds: 2),
                                            curve: Curves.easeOut,
                                            child: child,
                                          );
                                        },
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress != null &&
                                              loadingProgress
                                                      .expectedTotalBytes !=
                                                  null) {
                                            CircularProgressIndicator(
                                                value: loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!);
                                          }
                                          return child;
                                        },
                                      );
                                    },
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    PlayerCardApi.updatePlayerCard(
                                        context: context,
                                        playerCard: PlayerCardModel(
                                            keys: widget.keys,
                                            values: widget.values,
                                            male: !widget.male));
                                    setState(
                                      () {
                                        widget.male = !widget.male;
                                      },
                                    );
                                  },
                                  child: Image.network(
                                    errorBuilder: (context, exception,
                                            stackTrace) =>
                                        const Icon(Icons.network_wifi_1_bar),
                                    fit: BoxFit.cover,
                                    widget.male
                                        ? 'https://archives.bulbagarden.net/media/upload/4/4e/Spr_B2W2_Hilbert_2.png'
                                        : "https://archives.bulbagarden.net/media/upload/b/b7/Spr_B2W2_Hilda_2.png",
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  PlayerCardItem(
                      fieldKey: widget.keys[4], fieldValue: widget.values[4]),
                  PlayerCardItem(
                      fieldKey: widget.keys[5], fieldValue: widget.values[5]),
                ],
              ),
            )),
      ),
    );
  }
}
