import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/player_card_model.dart';

class PlayerCardApi {
  static DocumentReference<Map<String, dynamic>> getPlayerCard() {
    String uid = AuthApi.currentUser!.uid;

    return (FirebaseFirestore.instance
        .collection(DbConst.playerCards)
        .doc(uid));
  }

  static Future<bool> updatePlayerCard(
      {required BuildContext context,
      required PlayerCardModel playerCard}) async {
    String uid = AuthApi.currentUser!.uid;

    try {
      await FirebaseFirestore.instance
          .collection(DbConst.playerCards)
          .doc(uid)
          .set({
        ...PlayerCardModel(
          keys: playerCard.keys,
          values: playerCard.values,
          male: playerCard.male,
        ).toJson()
      });
      if (context.mounted) {
        showSnackBar(context, "Carte actualisée avec succès !");
      }
      return (true);
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? "Unexpected error");
      }
    }
    return (false);
  }
}
