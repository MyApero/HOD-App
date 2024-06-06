import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/constants/db_const.dart';

enum Role { admin, member, user }

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final Role role;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
  });

  @override
  String toString() {
    return 'User{uid: $uid, username: $username, email: $email, firstName: $firstName, lastName: $lastName, role: $role}';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json[DbConst.uid],
      username: json[DbConst.username],
      email: json[DbConst.email],
      firstName: json[DbConst.firstName],
      lastName: json[DbConst.lastName],
      role: Role.values.firstWhere((e) => e.toString() == json[DbConst.role]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DbConst.uid: uid,
      DbConst.username: username,
      DbConst.email: email,
      DbConst.firstName: firstName,
      DbConst.lastName: lastName,
      DbConst.role: role.name,
      DbConst.lastConnection: Timestamp.now(),
    };
  }
}
