import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBIgIYDCWb05WvVBaP_B5sEld4lXHjI8v4",
            authDomain: "horta-8c609.firebaseapp.com",
            projectId: "horta-8c609",
            storageBucket: "horta-8c609.appspot.com",
            messagingSenderId: "185208250226",
            appId: "1:185208250226:web:33fbca49947532baf687eb",
            measurementId: "G-VSZSW3P1MS"));
  } else {
    await Firebase.initializeApp();
  }
}
