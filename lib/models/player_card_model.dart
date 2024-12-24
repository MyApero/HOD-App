import 'package:hod/constants/constants.dart';

class PlayerCardModel {
  PlayerCardModel(
      {required this.keys, required this.values, required this.male});

  final List<String> keys;
  final List<String> values;
  final bool male;

  factory PlayerCardModel.fromJson(Map<String, dynamic> json) {
    return PlayerCardModel(
      keys: List<String>.from(json[DbConst.keys] as List),
      values: List<String>.from(json[DbConst.values] as List),
      male: json[DbConst.male] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {DbConst.keys: keys, DbConst.values: values, DbConst.male: male};
  }
}
