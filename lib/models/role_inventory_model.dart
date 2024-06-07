import 'package:hod_app/constants/constants.dart';

class RoleInventoryModel {
  RoleInventoryModel({
    required this.items,
    required this.values
  });

  final List<String> items;
  final List<String> values;

  factory RoleInventoryModel.fromJson(Map<String, dynamic> json) {
    return RoleInventoryModel(
      items: List<String>.from(json[DbConst.items] as List),
      values: List<String>.from(json[DbConst.values] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.items: items,
      DbConst.values: values,
    };
  }
}