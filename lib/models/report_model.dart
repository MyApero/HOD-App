import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod_app/constants/constants.dart';

enum ReportType { asso, app }

class ReportModel {
  final String message;
  final String createdBy;
  final DateTime createdAt;
  final String type;


  ReportModel({
    required this.message,
    required this.createdBy,
    required this.createdAt,
    required this.type,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      message: json[DbConst.message],
      createdBy: json[DbConst.createdBy],
      createdAt: json[DbConst.createdAt],
      type: json[DbConst.type]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.message: message,
      DbConst.createdBy: createdBy,
      DbConst.createdAt: Timestamp.fromDate(createdAt),
      DbConst.type: type
    };
  }

}