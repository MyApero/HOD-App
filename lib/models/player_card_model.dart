import 'package:hod_app/constants/constants.dart';

class PlayerCardModel {
  PlayerCardModel({
    required this.keys,
    required this.values
  });

  final List<String> keys;
  final List<String> values;

  factory PlayerCardModel.fromJson(Map<String, dynamic> json) {
    return PlayerCardModel(
      keys: List<String>.from(json[DbConst.keys] as List),
      values: List<String>.from(json[DbConst.values] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.keys: keys,
      DbConst.values: values,
    };
  }
}
