import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/models/role_card_model.dart';

class RoleCardData extends StatelessWidget {
  const RoleCardData({super.key, required this.builder, this.idFilter});

  final Widget Function(List<RoleCardModel> event) builder;
  final String? idFilter;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: idFilter == null
          ? RoleCardApi.getRoleCards()
          : RoleCardApi.getRoleCards(id: idFilter),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          List<RoleCardModel> roleCards = snapshot.data!.docs
              .map<RoleCardModel>((e) => RoleCardModel.fromJson(e.data(), e.id))
              .toList();
          // List<RoleCardModel> roleCards = RoleCardApi.getRoleCards();
          return builder(roleCards);
        }
        return const Text('No data');
      },
    );
  }
}
