import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/db_const.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/player_card_model.dart';
import 'package:hod_app/models/user_model.dart';
import 'package:hod_app/features/auth/screens/verify_mail.dart';

class AuthApi {
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
        ).toJson(),
        DbConst.createdAt: Timestamp.now(),
      });

      await FirebaseFirestore.instance
          .collection(DbConst.playerCard)
          .doc(userCredential.user!.uid)
          .set(
          PlayerCardModel(
          keys: <String>["Catégorie 1", "Catégorie 2", "Catégorie 3",  "Catégorie 4",  "Catégorie 5",  "Catégorie 6"],
          values: <String>["Valeur 1", "Valeur 2", "Valeur 3", "Valeur 4", "Valeur 5", "Valeur 6"],
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
    BuildContext? context,
    required String email,
    required String password,
  }) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (context != null) {
        showSnackBar(context,
            e.message ?? 'Some unexpected FirebaseAuthException occured');
      }
      return false;
    }
  }

  static User? get currentUser => FirebaseAuth.instance.currentUser;

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> sendEmailVerification() async {
    if (currentUser != null) {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } else {
      throw Exception('No user is currently logged in');
    }
  }
}
