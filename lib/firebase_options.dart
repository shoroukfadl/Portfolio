import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    return const FirebaseOptions(
      apiKey: "AIzaSyBkaLW3pW47RepTJ1z8boG_N0SSvbjxoD4",
      authDomain: "rocklisnotify.firebaseapp.com",
      projectId: "rocklisnotify",
      storageBucket: "rocklisnotify.appspot.com",
      messagingSenderId: "381464266397",
      appId: "1:381464266397:web:280eb7386490f112c2b674",
      measurementId: "G-49FE83V5CJ",
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBkaLW3pW47RepTJ1z8boG_N0SSvbjxoD4',
    appId: '1:381464266397:web:280eb7386490f112c2b674',
    messagingSenderId: '381464266397',
    projectId: 'rocklisnotify',
    authDomain: 'rocklisnotify.firebaseapp.com',
    storageBucket: 'rocklisnotify.appspot.com',
  );
}
