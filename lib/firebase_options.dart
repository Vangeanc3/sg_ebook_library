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
    apiKey: 'AIzaSyBzBGV5Q8RymeAI8Y9epdHQn4gRdSVWwJM',
    appId: '1:976314315966:web:923bd3453c15155a42daef',
    messagingSenderId: '976314315966',
    projectId: 'sg-ebook-library',
    authDomain: 'sg-ebook-library.firebaseapp.com',
    storageBucket: 'sg-ebook-library.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNKPTDWsc21QCDa5LTzLxHEF8Xlb6Zrq4',
    appId: '1:976314315966:android:8004953df5f268d342daef',
    messagingSenderId: '976314315966',
    projectId: 'sg-ebook-library',
    storageBucket: 'sg-ebook-library.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAVMSykz8pRMjycUXAX4YOzGUCKFZMI58',
    appId: '1:976314315966:ios:b6566dfa9ec9918242daef',
    messagingSenderId: '976314315966',
    projectId: 'sg-ebook-library',
    storageBucket: 'sg-ebook-library.appspot.com',
    iosBundleId: 'com.example.grimorio',
  );
}
