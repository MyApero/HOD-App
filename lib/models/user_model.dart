import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/models/member_card_model.dart';
import 'package:hod_app/models/role_card_model.dart';

enum Role { user, member, staff, admin }

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final Role role;
  final List<RoleCardModel> roleCards;
  final MemberCardModel memberCard;

  UserModel(
      {required this.uid,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.roleCards,
      required this.memberCard});

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
      role: Role.values.firstWhere((e) => e.name == json[DbConst.role],
          orElse: () => Role.user),
      roleCards: [],
<<<<<<< Updated upstream
      memberCard: MemberCardModel(id: "0", peremptionDate: DateTime.now()
      ),
      // memberCard: json[DbConst.memberCard](json[DbConst.memberCard].fromJson()),
=======
      memberCard: (json[DbConst.memberCard].fromJson()),
>>>>>>> Stashed changes
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
      DbConst.roleCards: roleCards,
      DbConst.memberCard: memberCard.toJson(),
    };
  }
}
