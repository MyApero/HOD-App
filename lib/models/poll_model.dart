import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod/constants/db_const.dart';

class PollItemModel {
  final String name;
  final List<String> voters;

  PollItemModel({
    required this.name,
    required this.voters,
  });

  Map<String, dynamic> toJson() {
    return {
      DbConst.name: name,
      DbConst.voters: voters,
    };
  }
}

class PollModel {
  final String? id;
  final String username;
  final String name;
  final String? password;
  final DateTime createdAt;
  final DateTime? endedAt;
  final String createdBy;
  final String question;
  final List<PollItemModel> options;
  final bool multipleChoice;

  List<String> get voters =>
      options.expand((element) => element.voters).toList();
  int get votesCount => voters.length;
  bool get hasEnded => endedAt != null && DateTime.now().isAfter(endedAt!);

  PollModel({
    this.id,
    required this.username,
    required this.name,
    this.password,
    required this.createdAt,
    this.endedAt,
    required this.createdBy,
    required this.question,
    required this.options,
    this.multipleChoice = false,
  });

  @override
  String toString() {
    return 'Poll{name: $name, id: $id, createdAt: $createdAt, endedAt: $endedAt, createdByUid: $createdBy, createdByUsername: $username, question: $question, multipleChoice: $multipleChoice, options: $options}';
  }

  factory PollModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return PollModel(
      id: id,
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
      multipleChoice: json[DbConst.multipleChoice] ?? false,
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
      DbConst.options: options.map((e) => e.toJson()).toList(),
      DbConst.multipleChoice: multipleChoice,
    };
  }
}
