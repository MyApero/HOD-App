import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/role_card_model.dart';

class RoleCardApi {
  static Future<QuerySnapshot<Map<String, dynamic>>> getRoleCards(
      {String? id}) async {
    String userUid = AuthApi.currentUser!.uid;
    // get all the roleCardsId from the user rolecards
    if (id == null) {
      var doc = await FirebaseFirestore.instance
          .collection(DbConst.users)
          .doc(userUid)
          .get();
      if (doc["roleCards"] == null ) {
        FirebaseFirestore.instance.collection(DbConst.users).doc(userUid).set({
          DbConst.roleCards: []
        }, SetOptions(merge: true));
      }
      List<String> roleCardsIds = List<String>.from(doc["roleCards"] as List);
      roleCardsIds.add("nullid");
      return FirebaseFirestore.instance
          .collection(DbConst.roleCards)
          .where(FieldPath.documentId, whereIn: roleCardsIds)
          .get();
    }
    return FirebaseFirestore.instance
        .collection(DbConst.roleCards)
        .where(FieldPath.documentId, isEqualTo: id)
        .get();
  }

  static void addRoleCard(
      {required BuildContext context, required RoleCardModel roleCard}) async {
    String userId = AuthApi.currentUser!.uid;
    var collection = FirebaseFirestore.instance.collection(DbConst.roleCards);

    try {
      var document = await collection.add(roleCard.toJson());
      String cardId = document.id;

      var userDocument =
          FirebaseFirestore.instance.collection(DbConst.users).doc(userId);

      await userDocument.update({
        DbConst.roleCards: FieldValue.arrayUnion([cardId])
      });
      if (context.mounted) {
        showSnackBar(
            context, "Votre nouveau personnage a été ajouté avec succès !");
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? "Unexpected error");
      }
    }
  }

  static void updateRoleCard(
      {required BuildContext context,
      required RoleCardModel roleCard}) async {

    try {
      await FirebaseFirestore.instance
          .collection(DbConst.roleCards)
          .doc(roleCard.id)
          .set({
        ...RoleCardModel(
          name: roleCard.name,
          keys: roleCard.keys,
          values: roleCard.values,
          inventory: roleCard.inventory,
          characteristics: roleCard.characteristics
        ).toJson()
      });
      if (context.mounted) {
        showSnackBar(context, "Carte actualisée avec succès !");
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? "Unexpected error");
      }
    }
  }
}
