import 'package:flutter/material.dart';
import 'package:hod/apis/player_card_api.dart';
import 'package:hod/models/player_card_model.dart';

class PlayerCardData extends StatelessWidget {
  const PlayerCardData({super.key, required this.builder});

  final Widget Function(PlayerCardModel playerCard) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: PlayerCardApi.getPlayerCard().snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final data = snapshot.data!.data();
          print(data);
          final PlayerCardModel playerCard =
              PlayerCardModel.fromJson(snapshot.data!.data()!);
          // print(playerCard);
          return builder(playerCard);
        }
        return const Text('No data');
      },
    );
  }
}
