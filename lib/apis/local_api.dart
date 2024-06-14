import 'dart:convert';

import 'package:hod_app/main.dart';
import 'package:hod_app/models/user_model.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/db_const.dart';

class LocalApi {
  static void storeUserInLocal() async {
    UserModel? currentUser = await AuthApi.getUser();
    if (currentUser == null) return;
    sharedPref!.setString(DbConst.user, json.encode(currentUser.toJson()));
  }

  static UserModel getCurrentUser() {
    return UserModel.fromJson(
      json.decode(sharedPref!.get(DbConst.user) as String),
    );
  }
}