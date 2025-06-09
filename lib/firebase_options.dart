// Arquivo gerado automaticamente pelo FlutterFire CLI
// Execute: flutterfire configure

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Configurações para cada plataforma
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
    apiKey: 'SUA_API_KEY_WEB',
    appId: 'SEU_APP_ID_WEB',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJETO_ID',
    authDomain: 'SEU_DOMINIO.firebaseapp.com',
    storageBucket: 'SEU_BUCKET.appspot.com',
    measurementId: 'SEU_MEASUREMENT_ID',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'SUA_API_KEY_ANDROID',
    appId: 'SEU_APP_ID_ANDROID',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJETO_ID',
    storageBucket: 'SEU_BUCKET.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'SUA_API_KEY_IOS',
    appId: 'SEU_APP_ID_IOS',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJETO_ID',
    storageBucket: 'SEU_BUCKET.appspot.com',
    iosBundleId: 'SEU_BUNDLE_ID',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'SUA_API_KEY_MACOS',
    appId: 'SEU_APP_ID_MACOS',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJETO_ID',
    storageBucket: 'SEU_BUCKET.appspot.com',
    iosBundleId: 'SEU_BUNDLE_ID',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'SUA_API_KEY_WINDOWS',
    appId: 'SEU_APP_ID_WINDOWS',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJETO_ID',
    storageBucket: 'SEU_BUCKET.appspot.com',
  );
}
