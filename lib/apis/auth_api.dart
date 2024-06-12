import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/player_card_model.dart';
import 'package:hod_app/models/user_model.dart';
import 'package:hod_app/features/auth/screens/verify_mail.dart';

class AuthApi {

  static Future<bool> usernameAvailable(String username) async
  {
    var docs = await FirebaseFirestore.instance.collection(DbConst.users).where(DbConst.username, isEqualTo: username).get();

    return (docs.docs.isEmpty);
  }

  static Future<bool> register({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        if (context.mounted) {
          showSnackBar(context, 'No user was created');
        }
        return false;
      }
      userCredential.user!.updateDisplayName(username);
      await FirebaseFirestore.instance
          .collection(DbConst.users)
          .doc(userCredential.user!.uid)
          .set({
        ...UserModel(
            uid: userCredential.user!.uid,
            username: username,
            email: email,
            firstName: firstName,
            lastName: lastName,
            role: Role.user,
            roleCards: []).toJson(),
        DbConst.createdAt: Timestamp.now(),
      });

      await FirebaseFirestore.instance
          .collection(DbConst.playerCards)
          .doc(userCredential.user!.uid)
          .set(
            PlayerCardModel(
              keys: <String>["", "", "", "", "", ""],
              values: <String>["", "", "", "", "", ""],
              male: true
            ).toJson(),
          );

      userCredential.user!.sendEmailVerification();
      if (context.mounted) {
        Navigator.pushReplacement(context, VerifyMailScreen.route());
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context,
            e.message ?? 'Some unexpected FirebaseAuthException occured');
      }
      return false;
    }
  }

  static Future<bool> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context,
          e.message ?? 'Some unexpected FirebaseAuthException occured');
    }
    return false;
  }

  static Future<bool> reauth({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      if (currentUser == null) {
        throw Exception('No user is currently logged in');
      }
      await currentUser!.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context,
          e.message ?? 'Some unexpected FirebaseAuthException occured');
    } catch (e) {
      showSnackBar(context, 'Some unexpected error occured');
    }
    return false;
  }

  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<bool> deleteAccount(BuildContext context) async {
    try {
      if (currentUser == null) {
        throw Exception('No user is currently logged in');
      }
      String uid = currentUser!.uid;
      await currentUser!.delete();
      await FirebaseFirestore.instance
          .collection(DbConst.users)
          .doc(uid)
          .delete();
      await FirebaseFirestore.instance
          .collection(DbConst.playerCards)
          .doc(uid)
          .delete();
      return true;
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(
            context,
            e.message ??
                'Impossible de supprimer votre compte, vous nous manqueriez trop');
      }
    }
    return false;
  }

  static Future<void> sendEmailVerification() async {
    if (currentUser != null) {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } else {
      throw Exception('No user is currently logged in');
    }
  }

  static Future<UserModel?> getUser() async {
    if (currentUser == null) return null;
    final userDoc = await FirebaseFirestore.instance
        .collection(DbConst.users)
        .doc(currentUser!.uid)
        .get();
    return UserModel.fromJson(userDoc.data()!);
  }
}
