import 'package:hod/constants/constants.dart';
import 'package:hod/constants/db_const.dart';

class MemberCardModel {
  MemberCardModel({
    required this.id,
    required this.peremptionDate,
  });

  final String id;
  final DateTime peremptionDate;

  factory MemberCardModel.fromJson(Map<String, dynamic> json) {
    return MemberCardModel(
      id: json[DbConst.id],
      peremptionDate: json[DbConst.peremptionDate] == null
          ? DateTime.now()
          : DateTime.parse(json[DbConst.peremptionDate]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.id: id,
      DbConst.peremptionDate: peremptionDate.toIso8601String()
    };
  }
}
