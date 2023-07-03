import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/library_screen.dart';

class ScaffoldNavBar extends StatelessWidget {
  const ScaffoldNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            activeIcon: Icon(Icons.library_books),
            label: 'My Library',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    // Try-catch block to catch mysterious Exception / bug
    try {
      final String location = GoRouterState.of(context).location;
      if (location == HomeScreen.routePath) {
        return 0;
      } else if (location == LibraryScreen.routePath) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    return switch (index) {
      0 => context.go(HomeScreen.routePath),
      1 => context.go(LibraryScreen.routePath),
      _ => throw (Exception('Index $index doesn\'t exist in the Nav Bar')),
    };
  }
}
