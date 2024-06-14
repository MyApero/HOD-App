import 'dart:convert';

import 'package:hod_app/main.dart';
import 'package:hod_app/models/user_model.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/db_const.dart';

class LocalApi {
  static Future<bool> storeCurrentUserInLocal() async {
    UserModel? currentUser = await AuthApi.getUser();
    if (currentUser == null) return (false);
    storeUserInLocal(currentUser);
    return (true);
  }

  static Future<void> storeUserInLocal(UserModel user) async {
    sharedPref!.setString(DbConst.user, json.encode(user.toJson()));
  }

  static UserModel getCurrentUser() {
    return UserModel.fromJson(
      json.decode(sharedPref!.get(DbConst.user) as String),
    );
  }
}
