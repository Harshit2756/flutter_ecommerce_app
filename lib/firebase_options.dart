// File generated by FlutterFire CLI.
// ignore_for_file: type=lint lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyD5kw9plkDCkpVqmkxWR-DwESDwabDVLRA',
    appId: '1:30959955961:web:a50a96b1738e303ccf9728',
    messagingSenderId: '30959955961',
    projectId: 'ecommerce-app-6067a',
    authDomain: 'ecommerce-app-6067a.firebaseapp.com',
    storageBucket: 'ecommerce-app-6067a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBELRu4iqaCZiEmwsHPOX9xkR405SRnYoE',
    appId: '1:30959955961:android:4525d20a60af1024cf9728',
    messagingSenderId: '30959955961',
    projectId: 'ecommerce-app-6067a',
    storageBucket: 'ecommerce-app-6067a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADGj0fMKTG_ukKUBh5ZtFFj8OwdcaruPM',
    appId: '1:30959955961:ios:fbddd3cb255e9e3dcf9728',
    messagingSenderId: '30959955961',
    projectId: 'ecommerce-app-6067a',
    storageBucket: 'ecommerce-app-6067a.appspot.com',
    androidClientId:
        '30959955961-8g9f2n8ohi6thic4qbqi8hjq1oqae6nh.apps.googleusercontent.com',
    iosClientId:
        '30959955961-rv85ng6bc9ofptlosa425uhdm29b5ch4.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );
}
