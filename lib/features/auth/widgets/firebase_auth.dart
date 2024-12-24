import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod/features/auth/screens/login.dart';
import 'package:hod/features/auth/screens/verify_mail.dart';
import 'package:hod/features/navigation/view/navigation_pages.dart';
import 'package:hod/features/background/app_scaffold.dart';

class FirebaseAuthWidget extends StatelessWidget {
  const FirebaseAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (streamContext, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppScaffold(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const AppScaffold(child: Text('Something went wrong'));
        } else if (snapshot.hasData) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            return NavigationPages();
          } else {
            return const VerifyMailScreen();
          }
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
