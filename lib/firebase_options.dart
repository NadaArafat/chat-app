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
    apiKey: 'AIzaSyAjFpetfL6o7PPXbv9GDi7yilzNT1cF2zM',
    appId: '1:1093132657088:web:150d9ce71c587b10d0a825',
    messagingSenderId: '1093132657088',
    projectId: 'chat-app-fc82d',
    authDomain: 'chat-app-fc82d.firebaseapp.com',
    storageBucket: 'chat-app-fc82d.firebasestorage.app',
    measurementId: 'G-Y24TB919HZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0qK7oIT8E8gjQAMO6UMnPyEEgRL-luRo',
    appId: '1:1093132657088:android:6674777aeb0a0111d0a825',
    messagingSenderId: '1093132657088',
    projectId: 'chat-app-fc82d',
    storageBucket: 'chat-app-fc82d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrM73RzApcHxbRrRc-xIEMf1LWCgA-kxE',
    appId: '1:1093132657088:ios:385d2d673b2dee4cd0a825',
    messagingSenderId: '1093132657088',
    projectId: 'chat-app-fc82d',
    storageBucket: 'chat-app-fc82d.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrM73RzApcHxbRrRc-xIEMf1LWCgA-kxE',
    appId: '1:1093132657088:ios:385d2d673b2dee4cd0a825',
    messagingSenderId: '1093132657088',
    projectId: 'chat-app-fc82d',
    storageBucket: 'chat-app-fc82d.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAc2lHe_nSYKoh6B7DJVJ_JzNUtjqjzpr4',
    appId: '1:1093132657088:web:26fedefdcf14a3a6d0a825',
    messagingSenderId: '1093132657088',
    projectId: 'chat-app-fc82d',
    authDomain: 'chat-app-fc82d.firebaseapp.com',
    storageBucket: 'chat-app-fc82d.firebasestorage.app',
    measurementId: 'G-7YEQM3GCKD',
  );
}
