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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoQ8dhsfyMS50gVECEbcwDT3u5bruGtWc',
    appId: '1:496132480766:android:ac5f92e8f58525707e8faf',
    messagingSenderId: '496132480766',
    projectId: 'test-a815f',
    databaseURL: 'https://test-a815f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-a815f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4JtP__GzzG8kYW4O0_0LIZd_OjebdY2s',
    appId: '1:496132480766:ios:502301276b4a821b7e8faf',
    messagingSenderId: '496132480766',
    projectId: 'test-a815f',
    databaseURL: 'https://test-a815f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-a815f.appspot.com',
    iosClientId: '496132480766-krcpvjhdda4ts0iibkuhg1lud7nl596d.apps.googleusercontent.com',
    iosBundleId: 'com.example.trackme',
  );
}
