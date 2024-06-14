import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/models/user_model.dart';

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
      peremptionDate: json[DbConst.peremptionDate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.id: id,
      DbConst.peremptionDate: peremptionDate
    };
  }
}
