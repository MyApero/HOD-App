import 'package:flutter/material.dart';
import 'package:hod_app/apis/role_card_api.dart';
import 'package:hod_app/models/role_card_model.dart';

class RoleCardData extends StatelessWidget {
  const RoleCardData({super.key, required this.builder});

  final Widget Function(List<RoleCardModel> event) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RoleCardApi.getRoleCards(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {

          final List<RoleCardModel> roleCards = snapshot.data!.docs
              .map<RoleCardModel>((e) => RoleCardModel.fromJson(e.data()))
              .toList();
          return builder(roleCards);
        }
        return const Text('No data');
      },
    );
  }
}
