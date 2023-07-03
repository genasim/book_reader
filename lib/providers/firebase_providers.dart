import 'package:book_reader/sevices/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider =
    StreamProvider<User?>((ref) => ref.read(authServiceProvider).user);
