import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDo9k1QqEncLLFKoyV3V2sJTM9Y2O0AwSg",
            authDomain: "phone-authentication-y1qutr.firebaseapp.com",
            projectId: "phone-authentication-y1qutr",
            storageBucket: "phone-authentication-y1qutr.firebasestorage.app",
            messagingSenderId: "963424228417",
            appId: "1:963424228417:web:67fc3067e60d2406cce2c0"));
  } else {
    await Firebase.initializeApp();
  }
}
