// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQLKoX_8_kCEHxPZsQkbxd5vAjYh_I4PQ',
    appId: '1:957815344604:web:0726056c034bf825101319',
    messagingSenderId: '957815344604',
    projectId: 'heavenofdice-c29b3',
    authDomain: 'heavenofdice-c29b3.firebaseapp.com',
    storageBucket: 'heavenofdice-c29b3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6GwYGbS8v7FJThxLPm1LVdoRwAPTmoQw',
    appId: '1:957815344604:android:5081eed3b786bcfa101319',
    messagingSenderId: '957815344604',
    projectId: 'heavenofdice-c29b3',
    storageBucket: 'heavenofdice-c29b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUxJTIjbPmf89ryvXtz4WEe1ZP6Arov1U',
    appId: '1:957815344604:ios:025d17ac8ec6f805101319',
    messagingSenderId: '957815344604',
    projectId: 'heavenofdice-c29b3',
    storageBucket: 'heavenofdice-c29b3.appspot.com',
    iosBundleId: 'com.heavenofdice.hod',
  );

}