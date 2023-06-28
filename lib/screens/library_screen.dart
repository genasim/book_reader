import 'package:book_reader/models/book.dart';
import 'package:book_reader/repositories/bookmarks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../sevices/mock_constants.dart';
import '../size_data.dart';
import '../widgets/book_card.dart';
import '../widgets/cards_row.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardsRow(title: 'Bookmarks', books: ref.read(bookmarksNotifier)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultSize),
              child: Divider(
                color: Theme.of(context).primaryColor,
                height: defaultSize,
                thickness: defaultSize * 0.3,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: defaultSize * 2, bottom: defaultSize),
              child: Text(
                'My library collection',
                style: TextStyle(
                    letterSpacing: defaultSize * 0.18,
                    fontSize: defaultSize * 1.8,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Wrap(
                runSpacing: defaultSize * 0.6,
                spacing: defaultSize * 0.6,
                children: manyBooks
                    .map((book) => SizedBox(
                          width: defaultSize * 8.5,
                          child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: InkWell(
                                onTap: () =>
                                    context.push('/details', extra: book),
                                child: BookCard(book: book)),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: defaultSize * 2)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_horiz,
              size: defaultSize * 2,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(onTap: () {}, child: const Text('Settings')),
            ],
          ),
        ],
      );
}
