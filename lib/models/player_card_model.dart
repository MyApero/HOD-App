import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/widgets/player_card.dart';

class PlayerCardModel {
  PlayerCardModel({
    required this.keys,
    required this.values
  });

  final List<String> keys;
  final List<String> values;

  factory PlayerCardModel.fromJson(Map<String, dynamic> json) {
    return PlayerCardModel(
      keys: json[DbConst.keys],
      values: json[DbConst.values],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.keys: keys,
      DbConst.values: values,
    };
  }
}