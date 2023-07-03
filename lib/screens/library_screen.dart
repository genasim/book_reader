import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bookmarks_provider.dart';
import '../providers/library_provider.dart';
import '../size_data.dart';
import '../widgets/cards_row.dart';
import '../widgets/library_collection.dart';

class LibraryScreen extends ConsumerWidget {
  static String get routeName => 'library';
  static String get routePath => '/$routeName';

  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ref.read(bookmarksNotifier).isNotEmpty)
              CardsRow(title: 'Bookmarks', books: ref.watch(bookmarksNotifier)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultSize),
              child: Divider(
                color: Theme.of(context).primaryColor,
                height: defaultSize,
                thickness: defaultSize * 0.3,
              ),
            ),
            LibraryCollection(collection: ref.watch(libraryNotifier)),
            SizedBox(height: defaultSize * 2),
          ],
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
                onTap: () async => await FirebaseAuth.instance.signOut(),
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
