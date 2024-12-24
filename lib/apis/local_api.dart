import 'dart:convert';

import 'package:hod/main.dart';
import 'package:hod/models/user_model.dart';
import 'package:hod/apis/auth_api.dart';
import 'package:hod/constants/db_const.dart';

class LocalApi {
  static Future<bool> storeCurrentUserInLocal() async {
    UserModel? currentUser = await AuthApi.getUser();
    if (currentUser == null) return (false);
    await storeUserInLocal(currentUser);
    return (true);
  }

  static Future<void> storeUserInLocal(UserModel user) async {
    sharedPref!.setString(DbConst.user, json.encode(user.toJson()));
  }

  static UserModel? getCurrentUser() {
    if (sharedPref!.get(DbConst.user) == null) return null;
    return UserModel.fromJson(
      json.decode(sharedPref!.get(DbConst.user) as String),
    );
  }
}
