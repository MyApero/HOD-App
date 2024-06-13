import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/role_card_model.dart';

class RoleCardApi {
  static Future<String> getRoleCardImage(String roleCardId) async {
    try {
      final docs = await FirebaseFirestore.instance
          .collection(DbConst.roleCards)
          .doc(roleCardId)
          .get();
      return docs[DbConst.imageUrl] ?? "";
    } catch (e) {
      return "";
    }
  }

  static Future<void> updateRoleCardImage(
      String roleCardId, String imageUrl) async {
    await FirebaseFirestore.instance
        .collection(DbConst.roleCards)
        .doc(roleCardId)
        .set({DbConst.imageUrl: imageUrl}, SetOptions(merge: true));
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getRoleCards(
      {String? id}) async {
    String userUid = AuthApi.currentUser!.uid;
    // get all the roleCardsId from the user rolecards
    if (id == null) {
      var doc = await FirebaseFirestore.instance
          .collection(DbConst.users)
          .doc(userUid)
          .get();
      if (doc["roleCards"] == null) {
        FirebaseFirestore.instance
            .collection(DbConst.users)
            .doc(userUid)
            .set({DbConst.roleCards: []}, SetOptions(merge: true));
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

  static Future<bool> addRoleCard(
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
      return (true);
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? "Unexpected error");
      }
    }
    return (false);
  }

  static Future<bool> deleteRoleCard(
      {required BuildContext context, required String id}) async {
    String userId = AuthApi.currentUser!.uid;

    try {
      await FirebaseFirestore.instance
          .collection(DbConst.users)
          .doc(userId)
          .update(
        {
          DbConst.roleCards: FieldValue.arrayRemove([id])
        },
      );
      await FirebaseFirestore.instance
          .collection(DbConst.roleCards)
          .doc(id)
          .delete();
      if (context.mounted) {
        showSnackBar(context, "Personnage supprimé avec succès !");
      }
      return (true);
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? "Unexpected error");
      }
    }
    return (false);
  }

  static void updateRoleCard(
      {required BuildContext context, required RoleCardModel roleCard}) async {
    try {
      await FirebaseFirestore.instance
          .collection(DbConst.roleCards)
          .doc(roleCard.id)
          .set({
        ...RoleCardModel(
                name: roleCard.name,
                keys: roleCard.keys,
                url: roleCard.url,
                values: roleCard.values,
                inventory: roleCard.inventory,
                characteristics: roleCard.characteristics)
            .toJson()
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
