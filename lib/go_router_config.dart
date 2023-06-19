import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/library_screen.dart';
import 'screens/login_screen.dart';
import 'widgets/scaffold_navbar.dart';

GoRouter? _goRouter;

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter get goRouter {
  _goRouter ??= GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/library',
            builder: (context, state) => const LibraryScreen(),
          ),
        ],
        builder: (context, state, child) => ScaffoldNavBar(child: child),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) => const DetailsScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      )
    ],
  );

  return _goRouter!;
}
