import 'package:book_reader/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/book.dart';
import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/library_screen.dart';
import 'widgets/scaffold_navbar.dart';

GoRouter? _goRouter;

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter get goRouter {
  _goRouter ??= GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: LoginScreen.routePath,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldNavBar(child: child),
        routes: [
          GoRoute(
            path: HomeScreen.routePath,
            name: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: LibraryScreen.routePath,
            name: LibraryScreen.routeName,
            builder: (context, state) => const LibraryScreen(),
          ),
        ],
      ),
      GoRoute(
        path: DetailsScreen.routePath,
        name: DetailsScreen.routeName,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          assert(state.extra is Book,
              'Extra of type [Book] must be provided when navigating to ${DetailsScreen.routePath}');
          return DetailsScreen(book: state.extra as Book);
        },
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routePath,
        builder: (context, state) => const LoginScreen(),
      )
    ],
  );

  return _goRouter!;
}
