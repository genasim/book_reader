import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  late final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Auth change user stream
  Stream<User?> get user => _auth.authStateChanges();

  /// Sign-in anonymously || @depricated TEMPORARY
  Future<User?> signInAnon() async {
    try {
      final token = await _auth.signInAnonymously();
      final User user = token.user!;

      return user;
    } catch (e) {
      return null;
    }
  }

  /// Create user with email & password
  Future<User?> createUserEmailPassword(
      {required String email, required String pass}) async {
    try {
      final UserCredential token = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      final User user = token.user!;
      return user;
    } catch (e) {
      return null;
    }
  }

  /// Login user with email & password
  Future<User?> signInEmailPassword(
      {required String email, required String pass}) async {
    try {
      final UserCredential token = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      final User user = token.user!;

      return user;
    } catch (e) {
      return null;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
