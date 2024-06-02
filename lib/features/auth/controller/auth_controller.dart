import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/core/utils.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

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
        print(r.email);
        // Navigator.pop(context);
      },
    );
  }
}
