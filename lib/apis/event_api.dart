import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/event_model.dart';
import 'package:uuid/uuid.dart';

enum Pole {
  rolegame,
  boardgame,
  chess,
  tradingcardgame,
  wargame,
  werewolf,
  toudoulelou
}

class EventApi {
  static Future<bool> createEvent({
    required BuildContext context,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required String createdBy,
    String? pole,
    required String location,
    String? description,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        showSnackBar(context, 'No user is currently logged in');
        return false;
      }
      final eventid = const Uuid().v1();
      await FirebaseFirestore.instance
          .collection(DbConst.events)
          .doc(eventid)
          .set({
        ...EventModel(
          id: eventid,
          name: name,
          location: location,
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

  static List<EventModel> getEvents(
      {required AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      String? poleFilter}) {
    List<EventModel> events = [];

    if (poleFilter != null) {
      events = snapshot.data!.docs
          .where((document) => document[DbConst.pole] == poleFilter)
          .map<EventModel>((e) => EventModel.fromJson(e.data()))
          .toList();
    } else {
      events = snapshot.data!.docs
          .map<EventModel>((e) => EventModel.fromJson(e.data()))
          .toList();
    }
    return events;
  }

  static Future<EventModel?> getEvent({required String eventId}) async {
    final doc = await FirebaseFirestore.instance
        .collection(DbConst.events)
        .doc(eventId)
        .get();
    if (!doc.exists || doc.data() == null) {
      return null;
    }
    return EventModel.fromJson(doc.data()!);
  }
}
