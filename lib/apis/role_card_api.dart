import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/apis/event_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/role_card_model.dart';

class RoleCardApi {

  static Stream<QuerySnapshot<Map<String, dynamic>>> getRoleCards() async* {
    String userUid = AuthApi.currentUser!.uid;
    List<String> roleCardsIds = [];
    // get all the roleCardsId from the user rolecards
    var doc = await FirebaseFirestore.instance.collection(DbConst.users).doc(userUid).get();
    // roleCardsIds = List<String>.from(doc["roleCards"] as List);
    print(roleCardsIds);
    yield *FirebaseFirestore.instance.collection(DbConst.roleCards).where(FieldPath.documentId, whereIn: roleCardsIds).snapshots();
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
      showSnackBar(context, "Votre nouveau personnage a été ajouté avec succès !");
      } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? "Unexpected error");
      }
    }
  }
}
