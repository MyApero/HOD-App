import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/event_model.dart';

enum Pole { rolegame, boardgame, chess, tradingcardgame, wargame, werewolf, toudoulelou }

class EventApi {
  static Future<bool> createEvent({
    required BuildContext context,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required String createdBy,
    String? pole,
    String? location,
    String? description,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        showSnackBar(context, 'No user is currently logged in');
        return false;
      }
      await FirebaseFirestore.instance.collection(DbConst.events).add({
        ...EventModel(
          name: name,
          startDate: startDate,
          endDate: endDate,
          createdBy: createdBy,
          pole: pole,
        ).toJson(),
        DbConst.createdAt: Timestamp.now(),
      });
      return true;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message ?? 'Some unexpected error occured');
      }
      return false;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getEvents({
    String? poleFilter
  }) {
    if (poleFilter != null) {
      return FirebaseFirestore.instance
              .collection(DbConst.events)
              .where(DbConst.pole, isEqualTo: poleFilter)
              .snapshots();
    } else {
      return FirebaseFirestore.instance.collection(DbConst.events).snapshots();
    }
  }
}
