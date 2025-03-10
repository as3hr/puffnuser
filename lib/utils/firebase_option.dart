// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "---------------",
      authDomain: "-----------------",
      projectId: "-----------------------",
      storageBucket: "--------------------------",
      messagingSenderId: "---------------",
      appId: "----------------",
      measurementId: "-----------------");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9u05eUDSKOOINuktZkpX3LowpTS1ov-M',
    appId: '1:230350784895:android:69dfee4b8ace4aef58324a',
    messagingSenderId: '230350784895',
    projectId: 'oncab-10cce',
    storageBucket: 'oncab-10cce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "---------------------",
    authDomain: "------------------------",
    projectId: "---------------------",
    storageBucket: "------------------",
    messagingSenderId: "-------------------",
    appId: "----------------------------",
    measurementId: "---------------------",
    androidClientId: '---------------------------',
    iosClientId: '--------------------',
    iosBundleId: '------------------',
  );
}
