import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'models/book.dart';
import 'providers/firebase_providers.dart';
import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/library_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'widgets/scaffold_navbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashScreen.routePath,
    routes: [
      GoRoute(
        path: SplashScreen.routePath,
        name: SplashScreen.routeName,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.routePath,
        name: LoginScreen.routeName,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
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
    ],
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (user.isLoading || user.hasError) return null;

      // Here we guarantee that hasData == true, i.e. we have a readable value

      // This has to do with how the FirebaseAuth SDK handles the "log-in" state
      // Returning `null` means "we are not authorized"
      final isAuth = user.valueOrNull != null;

      final isSplash = state.location == SplashScreen.routePath;
      if (isSplash) {
        return isAuth ? HomeScreen.routePath : LoginScreen.routePath;
      }

      final isLoggingIn = state.location == LoginScreen.routePath;
      if (isLoggingIn) return isAuth ? HomeScreen.routePath : null;

      return isAuth ? null : SplashScreen.routePath;
    },
  );
});
