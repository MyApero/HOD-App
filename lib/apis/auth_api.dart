import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/core/failure.dart';
import 'package:hod_app/core/providers.dart';
import 'package:hod_app/core/type_defs.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  MyFutureEither<User> register(
      {required String email, required String password});
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  MyFutureEither<User> register(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return Right(account);
    } on AppwriteException catch (e, stackTrace) {
      return Left(Failure(e.message ?? 'Some unexpected AppwriteException occured', stackTrace));
    } catch (e, stackTrace) {
      return Left(Failure(e.toString(), stackTrace));
    }
  }
}
