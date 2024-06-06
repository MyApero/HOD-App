import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/constants.dart';

class PlayerCardApi {
  static DocumentReference<Map<String, dynamic>> getPlayerCard() {
    String uid = AuthApi.currentUser!.uid;

    return (FirebaseFirestore.instance.collection(DbConst.playerCard).doc(uid));
  }
}