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
    apiKey: 'AIzaSyCuyH9wYxbBpK9FvMC02iZmm9YPZNl3iO0',
    appId: '1:27627863768:web:360f37176329088b7b61ad',
    messagingSenderId: '27627863768',
    projectId: 'authentication-fd10a',
    authDomain: 'authentication-fd10a.firebaseapp.com',
    storageBucket: 'authentication-fd10a.appspot.com',
    measurementId: 'G-MKKZQVBJCM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGxM_bnbIDo7FVSowY_rYLb1hy0bgJD4M',
    appId: '1:27627863768:android:ef9062d69aee1ccd7b61ad',
    messagingSenderId: '27627863768',
    projectId: 'authentication-fd10a',
    storageBucket: 'authentication-fd10a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmPieYxtmKpAZA5FiMTUkK-WSRCbzrVG0',
    appId: '1:27627863768:ios:981ea84e46b318ff7b61ad',
    messagingSenderId: '27627863768',
    projectId: 'authentication-fd10a',
    storageBucket: 'authentication-fd10a.appspot.com',
    iosClientId: '27627863768-mib6st7qmncaql6h0jv7cs4cevoadqs5.apps.googleusercontent.com',
    iosBundleId: 'com.example.project2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmPieYxtmKpAZA5FiMTUkK-WSRCbzrVG0',
    appId: '1:27627863768:ios:981ea84e46b318ff7b61ad',
    messagingSenderId: '27627863768',
    projectId: 'authentication-fd10a',
    storageBucket: 'authentication-fd10a.appspot.com',
    iosClientId: '27627863768-mib6st7qmncaql6h0jv7cs4cevoadqs5.apps.googleusercontent.com',
    iosBundleId: 'com.example.project2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCuyH9wYxbBpK9FvMC02iZmm9YPZNl3iO0',
    appId: '1:27627863768:web:3203ddb41cc15f417b61ad',
    messagingSenderId: '27627863768',
    projectId: 'authentication-fd10a',
    authDomain: 'authentication-fd10a.firebaseapp.com',
    storageBucket: 'authentication-fd10a.appspot.com',
    measurementId: 'G-TE60SV245V',
  );

}