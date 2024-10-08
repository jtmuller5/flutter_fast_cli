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
    apiKey: 'AIzaSyAA4P-0NbkUQE8Gp2_lvDQwHvybhxnufjo',
    appId: '1:354395306946:web:3b05aed748cf3fac36345b',
    messagingSenderId: '354395306946',
    projectId: 'flutter-fast',
    authDomain: 'flutter-fast.firebaseapp.com',
    storageBucket: 'flutter-fast.appspot.com',
    measurementId: 'G-W99JXDN615',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJGIPFadopnLxrkGCSF7AjDVNHQV5EM90',
    appId: '1:354395306946:android:760fabe2707ddaec36345b',
    messagingSenderId: '354395306946',
    projectId: 'flutter-fast',
    storageBucket: 'flutter-fast.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCssSav2O5YcMcCEGLai5MaA7vClmAoK9c',
    appId: '1:354395306946:ios:571355df1d3b339b36345b',
    messagingSenderId: '354395306946',
    projectId: 'flutter-fast',
    storageBucket: 'flutter-fast.appspot.com',
    androidClientId: '354395306946-6cvnnpebpi3moiko02ssfirof88pgsc3.apps.googleusercontent.com',
    iosClientId: '354395306946-3d6idkn96mgmtgsvpe6b1sfgd00oqjhs.apps.googleusercontent.com',
    iosBundleId: '{{ org }}.flutterfast-online-auth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCssSav2O5YcMcCEGLai5MaA7vClmAoK9c',
    appId: '1:354395306946:ios:387946ad16e2d87f36345b',
    messagingSenderId: '354395306946',
    projectId: 'flutter-fast',
    storageBucket: 'flutter-fast.appspot.com',
    androidClientId: '354395306946-6cvnnpebpi3moiko02ssfirof88pgsc3.apps.googleusercontent.com',
    iosClientId: '354395306946-cv70h4rq4m1vhe8u5g4avbbjcu8bsesg.apps.googleusercontent.com',
    iosBundleId: '{{ org }}.flutterfast-online-auth.RunnerTests',
  );
}
