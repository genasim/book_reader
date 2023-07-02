import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_options.dart';
import '../sevices/auth.dart';

final firebaseInitializer = FutureProvider<FirebaseApp>(
  (ref) async => await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ),
);

final authProvider = Provider((ref) => AuthService());

final authStateProvider = StreamProvider((ref) => ref.read(authProvider).user);
