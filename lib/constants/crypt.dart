import 'package:crypt/crypt.dart';

class CryptConst {
  // Events
  static const int rounds = 10;
  static String hashPassword(String password) =>
      Crypt.sha256(password, rounds: CryptConst.rounds, salt: "hod").hash;
}
