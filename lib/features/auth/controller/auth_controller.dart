import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/features/auth/screens/login.dart';
import 'package:hod_app/features/home/view/home.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

final currentUserProvider = FutureProvider<User?>((ref) {
  final controller = ref.watch(authControllerProvider.notifier);
  return controller.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<User?> currentUser() => _authAPI.currentUser();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.register(email: email, password: password);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Inscription réussie');
        login(email: email, password: password, context: context).then((value) {
          Navigator.pushReplacement(context, HomeScreen.route());
        });
      },
    );
    state = false;
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.login(email: email, password: password);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        Navigator.pushReplacement(context, HomeScreen.route());
      },
    );
    state = false;
  }

  Future<dynamic> logout({required BuildContext context}) async {
    state = true;
    _authAPI.logout().then((value) {
      Navigator.pushReplacement(context, LoginScreen.route());
      state = false;
    });
  }

  Future<void> sendVerificationMail({required BuildContext context}) async {
    state = true;
    final res = await _authAPI.sendVerificationMail();
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => showSnackBar(context, 'Verification mail sent'),
    );
    state = false;
  }
}
