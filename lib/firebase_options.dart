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
    apiKey: 'AIzaSyAwfLrJMMZm3S_OXSKkpg7bub_f2428sFE',
    appId: '1:987608538813:android:be0de19ba56aa44de0a1d4',
    messagingSenderId: '987608538813',
    projectId: 'training-3f665',
    storageBucket: 'training-3f665.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGOXE26F7d_dsFmEPFf1ObwjHTa5fduZo',
    appId: '1:987608538813:ios:c360d2fa1957cb36e0a1d4',
    messagingSenderId: '987608538813',
    projectId: 'training-3f665',
    storageBucket: 'training-3f665.firebasestorage.app',
    androidClientId: '987608538813-cvbno669u0qr8r24rr9dk1390cnaqpbk.apps.googleusercontent.com',
    iosClientId: '987608538813-jdas693e31dmn70riau534qc6vfp9car.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1',
  );
}
