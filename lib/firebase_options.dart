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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA67Ud967GWp7PUqq2jnA5U-ARGs8Pt7KM',
    appId: '1:1037251386280:web:6c841d0b5d77032210db9d',
    messagingSenderId: '1037251386280',
    projectId: 'evently-app-d1d73',
    authDomain: 'evently-app-d1d73.firebaseapp.com',
    storageBucket: 'evently-app-d1d73.firebasestorage.app',
    measurementId: 'G-MTK1J7R7YW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOdXjyLfqmpSORjfaYnvQaLgpOhhu_N4c',
    appId: '1:1037251386280:android:6061c9c6e04329d010db9d',
    messagingSenderId: '1037251386280',
    projectId: 'evently-app-d1d73',
    storageBucket: 'evently-app-d1d73.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpx9yLfxQOVQKJ5Z_S-B8Ot_W8EDMOKck',
    appId: '1:1037251386280:ios:3c7e44437151dad610db9d',
    messagingSenderId: '1037251386280',
    projectId: 'evently-app-d1d73',
    storageBucket: 'evently-app-d1d73.firebasestorage.app',
    iosBundleId: 'com.example.evently',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpx9yLfxQOVQKJ5Z_S-B8Ot_W8EDMOKck',
    appId: '1:1037251386280:ios:3c7e44437151dad610db9d',
    messagingSenderId: '1037251386280',
    projectId: 'evently-app-d1d73',
    storageBucket: 'evently-app-d1d73.firebasestorage.app',
    iosBundleId: 'com.example.evently',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA67Ud967GWp7PUqq2jnA5U-ARGs8Pt7KM',
    appId: '1:1037251386280:web:55e38627ccbf951210db9d',
    messagingSenderId: '1037251386280',
    projectId: 'evently-app-d1d73',
    authDomain: 'evently-app-d1d73.firebaseapp.com',
    storageBucket: 'evently-app-d1d73.firebasestorage.app',
    measurementId: 'G-0Y4QVDJGR9',
  );
}
