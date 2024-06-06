import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/apis/player_card_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/models/player_card_model.dart';
import 'package:hod_app/widgets/player_card.dart';

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
          final PlayerCardModel playerCard = PlayerCardModel.fromJson(snapshot.data!.data()!);
          return builder(playerCard);
        }
        return const Text('No data');
      },
    );
  }
}