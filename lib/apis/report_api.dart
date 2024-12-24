import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod/apis/auth_api.dart';
import 'package:hod/constants/constants.dart';
import 'package:hod/core/utils.dart';
import 'package:hod/models/report_model.dart';

class ReportApi {
  static void pushReport(
      {required BuildContext context, required ReportModel report}) async {
    String uid = AuthApi.currentUser!.uid;

    try {
      await FirebaseFirestore.instance.collection(DbConst.reports).doc().set({
        ...ReportModel(
                message: report.message,
                createdBy: uid,
                createdAt: DateTime.now(),
                type: report.type)
            .toJson()
      });
      if (context.mounted) {
        showSnackBar(context, "Rapport envoyé avec succès !");
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(
            context, e.message ?? "Le rapport n'a pas pu être envoyé :((");
      }
    }
  }
}
