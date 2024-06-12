import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/features/auth/screens/login.dart';
import 'package:hod_app/features/auth/screens/verify_mail.dart';
import 'package:hod_app/features/navigation/view/navigation_pages.dart';
import 'package:hod_app/features/background/app_scaffold.dart';

class FirebaseAuthWidget extends StatelessWidget {
  const FirebaseAuthWidget({super.key});

  // Future<void> _createAccountInFirebase(UserCredential userCredentials,
  //     String username, String userEmail, String userImageUrl) async {
  //   final userDocumentRef = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userCredentials.user!.uid);

  //   await userDocumentRef.set({
  //     'username': username,
  //     'email': userEmail,
  //     'image_url': userImageUrl,
  //     'created_at': Timestamp.now(),
  //   });
  //   widget.setCreatingAccount(false);
  //   await userDocumentRef.collection('staff_chat').add({
  //     'text': staffChatWelcomeMessage,
  //     'createdAt': Timestamp.now(),
  //     'userId': adminUid,
  //     'username': 'Antoine',
  //     'userImage': defaultUserImageUrl,
  //   });
  // }

  // void _submit() async {
  //   final l10n = AppLocalizations.of(context)!;
  //   final isValid = _form.currentState!.validate();

  //   if (!isValid) {
  //     return;
  //   }

  //   _form.currentState!.save();

  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //     });
  //     if (_isLogin) {
  //       await _firebase.signInWithEmailAndPassword(
  //         email: _enteredEmail,
  //         password: _enteredPassword,
  //       );
  //     } else {
  //       widget.setCreatingAccount(true);
  //       final userCredentials = await _firebase.createUserWithEmailAndPassword(
  //           email: _enteredEmail, password: _enteredPassword);

  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('user_images')
  //           .child('${userCredentials.user!.uid}.jpg');

  //       await storageRef.putFile(_selectedImage!);
  //       final imageUrl = await storageRef.getDownloadURL();

  //       await _createAccountInFirebase(
  //           userCredentials, _enteredUserName, _enteredEmail, imageUrl);
  //     }
  //   } on FirebaseAuthException catch (error) {
  //     if (error.code == 'email-already-in-use') {
  //       // ...
  //     }
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).clearSnackBars();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(error.message ?? l10n.failedToConnect)));
  //     }

  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   }
  // }

  // void _signInWithGoogle(AppLocalizations l10n) async {
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   if (gUser == null) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).clearSnackBars();
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(l10n.failedToConnect)));
  //     }
  //     return;
  //   }
  //   final GoogleSignInAuthentication gAuth = await gUser.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );

  //   final userCredentials = await _firebase.signInWithCredential(credential);

  //   final userDocumentRef = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userCredentials.user!.uid);

  //   final userDocument = await userDocumentRef.get();
  //   if (userDocument.data() == null) {
  //     String userImageUrl = gUser.photoUrl ?? defaultUserImageUrl;
  //     String username = gUser.displayName ?? gUser.email.split('@')[0];
  //     await _createAccountInFirebase(
  //         userCredentials, username, gUser.email, userImageUrl);
  //   }
  // }

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
        });
  }
}
