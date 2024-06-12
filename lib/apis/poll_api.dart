import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/poll_model.dart';

class PollApi {
  static Future<bool> createPoll({
    required BuildContext context,
    required String username,
    required String name,
    String? password,
    required DateTime createdAt,
    DateTime? endedAt,
    required String createdBy,
    required String question,
    required List<String> options,
    bool multipleChoice = false,
  }) async {
    try {
      List<String> pollNames = await FirebaseFirestore.instance
          .collection(DbConst.polls)
          .where(DbConst.name, isEqualTo: name)
          .get()
          .then((value) =>
              value.docs.map((e) => e.data()[DbConst.name] as String).toList());
      if (pollNames.contains(name)) {
        if (context.mounted) {
          showSnackBar(context, 'Ce nom de sondage est déjà utilisé');
        }
        return false;
      }
      await FirebaseFirestore.instance.collection(DbConst.polls).add({
        ...PollModel(
          username: username,
          name: name,
          password: password,
          createdAt: createdAt,
          endedAt: endedAt,
          createdBy: createdBy,
          question: question,
          options:
              options.map((e) => PollItemModel(name: e, voters: [])).toList(),
          multipleChoice: multipleChoice,
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

  static Future<PollModel?> getPoll(
      {required String pollName, required String? password}) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(DbConst.polls)
          .where(DbConst.name, isEqualTo: pollName)
          .where(DbConst.password, isEqualTo: password)
          .get();
      if (doc.docs.isEmpty) {
        return null;
      }
      return PollModel.fromJson(doc.docs.first.data());
    } catch (e) {
      return null;
    }
  }

  static Future<bool> vote(
      {required PollModel poll,
      required List<int> voteIndexes,
      required String username}) async {
    final docQuery = FirebaseFirestore.instance
        .collection(DbConst.polls)
        .where(DbConst.name, isEqualTo: poll.name);
    final doc = await docQuery.get();
    if (doc.docs.isEmpty) {
      return false;
    }
    final dbPoll = PollModel.fromJson(doc.docs.first.data());
    final optionIndexes = dbPoll.options
        .map((e) => e.name)
        .map((e) => poll.options.indexWhere((element) => element.name == e))
        .toList();

    for (int i = 0; i < voteIndexes.length; i++) {
      final optionIndex = optionIndexes[voteIndexes[i]];
      if (optionIndex == -1) {
        return false;
      }
      final option = dbPoll.options[optionIndex];
      if (option.voters.contains(username)) {
        return false;
      }
      option.voters.add(username);
      dbPoll.options[optionIndex] = option;
    }

    await doc.docs.first.reference.update(
        {DbConst.options: dbPoll.options.map((e) => e.toJson()).toList()});
    return true;
  }
}
