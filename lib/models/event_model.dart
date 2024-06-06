import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod_app/constants/db_const.dart';

class EventModel {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String createdBy;
  final DateTime? createdAt;
  final String? pole;
  final String? description;

  EventModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.createdBy,
    this.createdAt,
    this.pole,
    this.description,
  });

  @override
  String toString() {
    return 'Event{name: $name, startDate: $startDate, endDate: $endDate, pole: $pole, description: $description, createdBy: $createdBy, createdAt: $createdAt}';
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      name: json[DbConst.name] ?? '!No event name!',
      startDate: (json[DbConst.startDate] ?? Timestamp.now()).toDate(),
      endDate: (json[DbConst.endDate] ?? Timestamp.now()).toDate(),
      createdBy: json[DbConst.createdBy] ?? 'Unknown user',
      createdAt: (json[DbConst.createdAt] ?? Timestamp.now()).toDate(),
      pole: json[DbConst.pole],
      description: json[DbConst.description],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.name: name,
      DbConst.startDate: Timestamp.fromDate(startDate),
      DbConst.endDate: Timestamp.fromDate(endDate),
      DbConst.createdBy: createdBy,
      DbConst.pole: pole,
      DbConst.description: description,
    };
  }
}
