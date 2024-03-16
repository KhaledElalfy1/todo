// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyClb2sc9e-Scv0cfARhEJCJa0ULwlYWXKg',
    appId: '1:985846268266:web:9a9705ef45f03854da6513',
    messagingSenderId: '985846268266',
    projectId: 'test-e61aa',
    authDomain: 'test-e61aa.firebaseapp.com',
    storageBucket: 'test-e61aa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKEaH_3L-YKT-zjqn6AoR8taKVOBoz1k4',
    appId: '1:985846268266:android:4210f39898f196b6da6513',
    messagingSenderId: '985846268266',
    projectId: 'test-e61aa',
    storageBucket: 'test-e61aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBryT6OzjsvNGwcMw3kBTZMhvuv-gdkmrU',
    appId: '1:985846268266:ios:dc10f949acdd5bdeda6513',
    messagingSenderId: '985846268266',
    projectId: 'test-e61aa',
    storageBucket: 'test-e61aa.appspot.com',
    androidClientId: '985846268266-necevbth2p040v9qihu2c0tkro5ru59h.apps.googleusercontent.com',
    iosClientId: '985846268266-c608h5qcttcm57qdldv3lcokb9ef5tom.apps.googleusercontent.com',
    iosBundleId: 'com.example.testfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBryT6OzjsvNGwcMw3kBTZMhvuv-gdkmrU',
    appId: '1:985846268266:ios:4a782589253c679fda6513',
    messagingSenderId: '985846268266',
    projectId: 'test-e61aa',
    storageBucket: 'test-e61aa.appspot.com',
    androidClientId: '985846268266-necevbth2p040v9qihu2c0tkro5ru59h.apps.googleusercontent.com',
    iosClientId: '985846268266-lnu9olkab04ibcef3fseah2lo780fv1h.apps.googleusercontent.com',
    iosBundleId: 'com.example.testfirebase.RunnerTests',
  );
}
