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
    apiKey: 'AIzaSyAhfLeWTUif9PTLExARopFi5Rtty6t34gA',
    appId: '1:591601585604:web:3d5d93bd6ef1a318c4e891',
    messagingSenderId: '591601585604',
    projectId: 'homeless-55290',
    authDomain: 'homeless-55290.firebaseapp.com',
    storageBucket: 'homeless-55290.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbfYpfMvVJhmnrQ9cLKe5Zzi983mZtWqI',
    appId: '1:591601585604:android:e98974c92897c054c4e891',
    messagingSenderId: '591601585604',
    projectId: 'homeless-55290',
    storageBucket: 'homeless-55290.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRtSXn2C8Kv2WxInWxT0lel7-hmTNonJM',
    appId: '1:591601585604:ios:622484a4bb557c77c4e891',
    messagingSenderId: '591601585604',
    projectId: 'homeless-55290',
    storageBucket: 'homeless-55290.appspot.com',
    iosClientId: '591601585604-r3trn526sdjahb22qfnlo9ka30glnhnr.apps.googleusercontent.com',
    iosBundleId: 'com.example.http',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRtSXn2C8Kv2WxInWxT0lel7-hmTNonJM',
    appId: '1:591601585604:ios:622484a4bb557c77c4e891',
    messagingSenderId: '591601585604',
    projectId: 'homeless-55290',
    storageBucket: 'homeless-55290.appspot.com',
    iosClientId: '591601585604-r3trn526sdjahb22qfnlo9ka30glnhnr.apps.googleusercontent.com',
    iosBundleId: 'com.example.http',
  );
}