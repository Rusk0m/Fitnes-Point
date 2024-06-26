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
    apiKey: 'AIzaSyA5G0tTx6nZN1BquXAmKIX_Q2muzeHCUuI',
    appId: '1:797717530147:web:87e1aea21b16b14e4f5396',
    messagingSenderId: '797717530147',
    projectId: 'fitnespoint-f3e8f',
    authDomain: 'fitnespoint-f3e8f.firebaseapp.com',
    databaseURL: 'https://fitnespoint'
        '-f3e8f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fitnespoint-f3e8f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwGPygG0j33TwtICZpx-q9tZlCQy72szA',
    appId: '1:797717530147:android:cf15c802610a06494f5396',
    messagingSenderId: '797717530147',
    projectId: 'fitnespoint-f3e8f',
    databaseURL: 'https://fitnespoint-f3e8f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fitnespoint-f3e8f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC__FIlTsatDh8vBQPoxFyuS6Mieh_pvRs',
    appId: '1:797717530147:ios:d44cf35ee3571fc94f5396',
    messagingSenderId: '797717530147',
    projectId: 'fitnespoint-f3e8f',
    databaseURL: 'https://fitnespoint-f3e8f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fitnespoint-f3e8f.appspot.com',
    iosBundleId: 'com.example.fitnesPoint',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC__FIlTsatDh8vBQPoxFyuS6Mieh_pvRs',
    appId: '1:797717530147:ios:d44cf35ee3571fc94f5396',
    messagingSenderId: '797717530147',
    projectId: 'fitnespoint-f3e8f',
    databaseURL: 'https://fitnespoint-f3e8f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fitnespoint-f3e8f.appspot.com',
    iosBundleId: 'com.example.fitnesPoint',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA5G0tTx6nZN1BquXAmKIX_Q2muzeHCUuI',
    appId: '1:797717530147:web:dec8a6661b305a194f5396',
    messagingSenderId: '797717530147',
    projectId: 'fitnespoint-f3e8f',
    authDomain: 'fitnespoint-f3e8f.firebaseapp.com',
    databaseURL: 'https://fitnespoint-f3e8f-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'fitnespoint-f3e8f.appspot.com',
  );

}