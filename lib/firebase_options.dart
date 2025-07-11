import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    const environment = String.fromEnvironment('environment', defaultValue: 'dev');

    if (kIsWeb) {
      switch (environment) {
        case 'dev':
          return devWeb;
        case 'prod':
          return prodWeb;
        default:
          throw UnsupportedError('Unknown environment: $environment');
      }
    }

    switch (environment) {
      case 'dev':
        return _getDevOptions();
      case 'prod':
        return _getProdOptions();
      default:
        throw UnsupportedError('Unknown environment: $environment');
    }
  }

  static FirebaseOptions _getDevOptions() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return devAndroid;
      case TargetPlatform.iOS:
        return devIos;
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
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  static FirebaseOptions _getProdOptions() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return prodAndroid;
      case TargetPlatform.iOS:
        return prodIos;
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
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  // Development environment Firebase options
  static const FirebaseOptions devAndroid = FirebaseOptions(
    apiKey: 'AIzaSyDU532Rv2oTWQf5qK7x1MTp5z_OQ-1syX4',
    appId: '1:132804793310:android:51ebc6b36813967fc2034f',
    messagingSenderId: '132804793310',
    projectId: 'ai-chat-7d6dd',
    storageBucket: 'ai-chat-7d6dd.firebasestorage.app',
  );

  static const FirebaseOptions devIos = FirebaseOptions(
    apiKey: 'AIzaSyAfiPkqJ2OetxBxjUQ7jBsmQXRpnyQIDUg',
    appId: '1:132804793310:ios:020b4a82894d2effc2034f',
    messagingSenderId: '132804793310',
    projectId: 'ai-chat-7d6dd',
    storageBucket: 'ai-chat-7d6dd.firebasestorage.app',
    iosBundleId: 'com.pet.aichat.dev',
  );

  // Production environment Firebase options
  static const FirebaseOptions prodAndroid = FirebaseOptions(
    apiKey: 'AIzaSyDU532Rv2oTWQf5qK7x1MTp5z_OQ-1syX4',
    appId: '1:132804793310:android:522937a5bd06905fc2034f',
    messagingSenderId: '132804793310',
    projectId: 'ai-chat-7d6dd',
    storageBucket: 'ai-chat-7d6dd.firebasestorage.app',
  );

  static const FirebaseOptions prodIos = FirebaseOptions(
    apiKey: 'AIzaSyAfiPkqJ2OetxBxjUQ7jBsmQXRpnyQIDUg',
    appId: '1:132804793310:ios:936dcd65d6c659bec2034f',
    messagingSenderId: '132804793310',
    projectId: 'ai-chat-7d6dd',
    storageBucket: 'ai-chat-7d6dd.firebasestorage.app',
    iosBundleId: 'com.pet.aichat',
  );

  // Web environment Firebase options (using same config for dev and prod as they share the same project)
  static const FirebaseOptions devWeb = FirebaseOptions(
    apiKey: 'AIzaSyCbq-IS4awh3VCmeMesAFCrG6QdJB43NCA',
    appId: '1:132804793310:web:a79fe7c8ce722b4ac2034f',
    messagingSenderId: '132804793310',
    projectId: 'ai-chat-7d6dd',
    authDomain: 'ai-chat-7d6dd.firebaseapp.com',
    storageBucket: 'ai-chat-7d6dd.firebasestorage.app',
  );

  static const FirebaseOptions prodWeb = FirebaseOptions(
    apiKey: 'AIzaSyCbq-IS4awh3VCmeMesAFCrG6QdJB43NCA',
    appId: '1:132804793310:web:a79fe7c8ce722b4ac2034f',
    messagingSenderId: '132804793310',
    projectId: 'ai-chat-7d6dd',
    authDomain: 'ai-chat-7d6dd.firebaseapp.com',
    storageBucket: 'ai-chat-7d6dd.firebasestorage.app',
  );
}