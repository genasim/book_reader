import 'package:book_reader/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sevices/mock_constants.dart';
import '../size_data.dart';
import '../widgets/cards_row.dart';

class HomeScreen extends ConsumerWidget {
  static String get routeName => 'home';
  static String get routePath => '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                CardsRow(
                  title: 'Your last reads ...',
                  books: books,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultSize * 4),
                  child: Divider(
                    color: Theme.of(context).primaryColor,
                    height: defaultSize,
                    thickness: defaultSize * 0.3,
                  ),
                )
              ] +
              List.generate(genres.length,
                  (index) => CardsRow(title: genres[index], books: books)),
        ),
      ),
    );
  }

  AppBar _buildAppBar(WidgetRef ref) => AppBar(
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_horiz,
              size: defaultSize * 2,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => ref.read(authProvider).signOut(),
                child: const Text('Sign out'),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Text('Settings'),
              ),
            ],
          ),
        ],
      );
}
