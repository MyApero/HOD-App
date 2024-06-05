import 'package:hod_app/constants/appwrite_constants.dart';

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
      startDate: DateTime.parse(json[DbConst.startDate]),
      endDate: DateTime.parse(json[DbConst.endDate]),
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
