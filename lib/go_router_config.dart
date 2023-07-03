// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'models/book.dart';
// import 'screens/details_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/library_screen.dart';
// import 'screens/login_screen.dart';
// import 'widgets/scaffold_navbar.dart';

// GoRouter? _goRouter;

// final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
// final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

// GoRouter get goRouter {
//   _goRouter ??= GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: LoginScreen.routePath,
//     routes: [
//       ShellRoute(
//         navigatorKey: _shellNavigatorKey,
//         builder: (context, state, child) => ScaffoldNavBar(child: child),
//         routes: [
//           GoRoute(
//             path: HomeScreen.routePath,
//             name: HomeScreen.routeName,
//             builder: (context, state) => const HomeScreen(),
//           ),
//           GoRoute(
//             path: LibraryScreen.routePath,
//             name: LibraryScreen.routeName,
//             builder: (context, state) => const LibraryScreen(),
//           ),
//         ],
//       ),
//       GoRoute(
//         path: DetailsScreen.routePath,
//         name: DetailsScreen.routeName,
//         parentNavigatorKey: _rootNavigatorKey,
//         builder: (context, state) {
//           assert(state.extra is Book,
//               'Extra of type [Book] must be provided when navigating to ${DetailsScreen.routePath}');
//           return DetailsScreen(book: state.extra as Book);
//         },
//       ),
//       GoRoute(
//         name: LoginScreen.routeName,
//         path: LoginScreen.routePath,
//         builder: (context, state) => const LoginScreen(),
//       )
//     ],
//   );

//   return _goRouter!;
// }

import 'package:book_reader/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/login_screen.dart';
import '_temp/auth.dart';
import '_temp/main.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,
    initialLocation: SplashPage.routeLocation,
    routes: [
      GoRoute(
        path: SplashPage.routeLocation,
        name: SplashPage.routeName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: HomeScreen.routeLocation,
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeLocation,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (authState.isLoading || authState.hasError) return null;

      // Here we guarantee that hasData == true, i.e. we have a readable value

      // This has to do with how the FirebaseAuth SDK handles the "log-in" state
      // Returning `null` means "we are not authorized"
      final isAuth = authState.valueOrNull != null;

      final isSplash = state.location == SplashPage.routeLocation;
      if (isSplash) {
        return isAuth ? HomeScreen.routeLocation : LoginScreen.routeLocation;
      }

      final isLoggingIn = state.location == LoginScreen.routeLocation;
      if (isLoggingIn) return isAuth ? HomeScreen.routeLocation : null;

      return isAuth ? null : SplashPage.routeLocation;
    },
  );
});
