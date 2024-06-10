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

  }) async {
    try {
      await FirebaseFirestore.instance.collection(DbConst.polls).add({
        ...PollModel(
          username: username,
          name: name,
          password: password,
          createdAt: createdAt,
          endedAt: endedAt,
          createdBy: createdBy,
          question: question,
          options: options
              .map((e) => PollItemModel(name: e, voters: []))
              .toList(),
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

  // static List<PollModel> getPolls(
  //     {required AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot}) {
  //   final polls = snapshot.data!.docs
  //       .map<PollModel>((e) => PollModel.fromJson(e.data()))
  //       .toList();
  //   return polls;
  // }
}
