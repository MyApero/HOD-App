import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod_app/constants/db_const.dart';

class Event {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String? pole;
  final String? description;

  Event({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.pole,
    required this.description,
  });

  @override
  String toString() {
    return 'Event{name: $name, startDate: $startDate, endDate: $endDate, pole: $pole, description: $description}';
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json[DbConst.name],
      startDate: (json[DbConst.startDate] as Timestamp).toDate(),
      endDate: (json[DbConst.endDate] as Timestamp).toDate(),
      pole: json[DbConst.pole],
      description: json[DbConst.description],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.name: name,
      DbConst.startDate: startDate.toIso8601String(),
      DbConst.endDate: endDate.toIso8601String(),
      DbConst.pole: pole,
      DbConst.description: description,
    };
  }
}
