import 'package:book_reader/repositories/bookmarks_provider.dart';
import 'package:book_reader/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';
import '../size_data.dart';
import '../widgets/book_description.dart';
import '../widgets/book_info.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context, ref, book: book),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight / 2,
              child: Stack(children: [
                Positioned(
                  left: -defaultSize * 3.5,
                  bottom: 0,
                  child: SizedBox(
                    width: defaultSize * 18,
                    child: AspectRatio(
                      aspectRatio: 8 / 12,
                      child: BookCard(book: book),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: defaultSize * 3,
                  child: BookInfo(book: book),
                ),
              ]),
            ),
            BookDescription(book: book),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref,
      {required Book book}) {
    bool isBookmarked = ref.watch(bookmarksNotifier).contains(book);

    return AppBar(
      actions: [
        IconButton(
            onPressed: () => ref.read(bookmarksNotifier.notifier).toggle(book),
            icon: Icon(
              isBookmarked ? Icons.bookmark_add : Icons.bookmark_add_outlined,
              size: defaultSize * 2,
            )),
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
      title: Text(
        book.title,
        style: TextStyle(fontSize: defaultSize * 1.8),
      ),
      leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: defaultSize * 2,
          )),
    );
  }
}
