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
    apiKey: 'AIzaSyAV0atwhRH2I-9JianKzJDUBRObGiSBqj8',
    appId: '1:918969432297:web:7ca1597ed9152b525ad878',
    messagingSenderId: '918969432297',
    projectId: 'dsigrupo-05-2025-1',
    authDomain: 'dsigrupo-05-2025-1.firebaseapp.com',
    storageBucket: 'dsigrupo-05-2025-1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTevyczD36JZQMeQF74iVVLo7CkWWep04',
    appId: '1:918969432297:android:bfddf15d7c2c0ed35ad878',
    messagingSenderId: '918969432297',
    projectId: 'dsigrupo-05-2025-1',
    storageBucket: 'dsigrupo-05-2025-1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEA6R512zULw-osCxUUTERvMIB9O3aXyE',
    appId: '1:918969432297:ios:ea94b056ff6ca2335ad878',
    messagingSenderId: '918969432297',
    projectId: 'dsigrupo-05-2025-1',
    storageBucket: 'dsigrupo-05-2025-1.firebasestorage.app',
    iosBundleId: 'com.example.dsiProjeto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEA6R512zULw-osCxUUTERvMIB9O3aXyE',
    appId: '1:918969432297:ios:ea94b056ff6ca2335ad878',
    messagingSenderId: '918969432297',
    projectId: 'dsigrupo-05-2025-1',
    storageBucket: 'dsigrupo-05-2025-1.firebasestorage.app',
    iosBundleId: 'com.example.dsiProjeto',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAV0atwhRH2I-9JianKzJDUBRObGiSBqj8',
    appId: '1:918969432297:web:3344e09be5bcf5c85ad878',
    messagingSenderId: '918969432297',
    projectId: 'dsigrupo-05-2025-1',
    authDomain: 'dsigrupo-05-2025-1.firebaseapp.com',
    storageBucket: 'dsigrupo-05-2025-1.firebasestorage.app',
  );
}