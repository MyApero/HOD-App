import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/models/role_characteristics_model.dart';
import 'package:hod_app/models/role_inventory_model.dart';

class RoleCardModel {
  RoleCardModel({
    required this.name,
    required this.keys,
    required this.values,
    required this.inventory,
    required this.characteristics,
    this.id
  });

  final String name;
  final List<String> keys;
  final List<String> values;
  final RoleInventoryModel inventory;
  final RoleCharacteristicsModel characteristics;
  final String ?id;

  String? getId() { return id; }

  factory RoleCardModel.fromJson(Map<String, dynamic> json, String id) {
    return RoleCardModel(
      name: json[DbConst.name],
      keys: List<String>.from(json[DbConst.keys] as List),
      values: List<String>.from(json[DbConst.values] as List),
      inventory: RoleInventoryModel.fromJson(json[DbConst.inventory]),
      characteristics: RoleCharacteristicsModel.fromJson(json[DbConst.characteristics]),
      id: id
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.name: name,
      DbConst.keys: keys,
      DbConst.values: values,
      DbConst.inventory: inventory!.toJson(),
      DbConst.characteristics: characteristics!.toJson()
    };
  }
}