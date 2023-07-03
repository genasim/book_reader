import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_options.dart';

final firebaseInitializer = FutureProvider<FirebaseApp>(
  (ref) async => await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ),
);

final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
