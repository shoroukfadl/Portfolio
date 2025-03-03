import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    return const FirebaseOptions(
          apiKey: "AIzaSyBXWJoNHVOu0-OaVvEkdUCZ1ak1R-QZkE0",
          authDomain: "portofilo-dd5c6.firebaseapp.com",
          projectId: "portofilo-dd5c6",
          storageBucket: "portofilo-dd5c6.firebasestorage.app",
          messagingSenderId: "308267064546",
          appId: "1:308267064546:web:398fa35a70c23c2fb7d2bb",
          measurementId: "G-2956X7JSKK"

    );
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyBXWJoNHVOu0-OaVvEkdUCZ1ak1R-QZkE0",
      authDomain: "portofilo-dd5c6.firebaseapp.com",
      projectId: "portofilo-dd5c6",
      storageBucket: "portofilo-dd5c6.firebasestorage.app",
      messagingSenderId: "308267064546",
      appId: "1:308267064546:web:398fa35a70c23c2fb7d2bb",
      measurementId: "G-2956X7JSKK"
  );
}
