import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod_app/constants/db_const.dart';

class PollItemModel {
  final String name;
  final List<String> voters;

  PollItemModel({
    required this.name,
    required this.voters,
  });
}

class PollModel {
  final String username;
  final String name;
  final String? password;
  final DateTime createdAt;
  final DateTime? endedAt;
  final String createdBy;
  final String question;
  final List<PollItemModel> options;

  PollModel({
    required this.username,
    required this.name,
    this.password,
    required this.createdAt,
    this.endedAt,
    required this.createdBy,
    required this.question,
    required this.options,
  });

  @override
  String toString() {
    return 'Poll{name: $name, createdAt: $createdAt, endedAt: $endedAt, createdByUid: $createdBy, createdByUsername: $username, question: $question, options: $options}';
  }

  factory PollModel.fromJson(Map<String, dynamic> json) {
    return PollModel(
      username: json[DbConst.username] ?? '! -- Unknown user --',
      name: json[DbConst.name] ?? '! -- No poll name --',
      password: json[DbConst.password],
      createdAt: (json[DbConst.createdAt] ?? Timestamp.now()).toDate(),
      endedAt: (json[DbConst.endedAt] ?? Timestamp.now()).toDate(),
      createdBy: json[DbConst.createdBy] ?? '! -- Unknown user --',
      question: json[DbConst.question] ?? '! -- No question --',
      options: (json[DbConst.options] ?? [])
          .map<PollItemModel>((e) => PollItemModel(
                name: e[DbConst.name] ?? '! -- No option name --',
                voters: (e[DbConst.voters] ?? []).cast<String>(),
              ))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.username: username,
      DbConst.name: name,
      DbConst.password: password,
      DbConst.createdAt: Timestamp.fromDate(createdAt),
      DbConst.endedAt: Timestamp.fromDate(endedAt ?? DateTime.now()),
      DbConst.createdBy: createdBy,
      DbConst.question: question,
      DbConst.options: options
          .map((e) => {
                DbConst.name: e.name,
                DbConst.voters: e.voters,
              })
          .toList(),
    };
  }
}
