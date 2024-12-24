import 'package:hod/constants/constants.dart';

class RoleCharacteristicsModel {
  RoleCharacteristicsModel(
      {required this.characteristics, required this.values});

  final List<String> characteristics;
  final List<String> values;

  factory RoleCharacteristicsModel.fromJson(Map<String, dynamic> json) {
    return RoleCharacteristicsModel(
      characteristics: List<String>.from(json[DbConst.characteristics] as List),
      values: List<String>.from(json[DbConst.values] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.characteristics: characteristics,
      DbConst.values: values,
    };
  }
}
