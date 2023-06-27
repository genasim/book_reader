import 'package:book_reader/repositories/bookmarks_repository.dart';
import 'package:book_reader/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';
import '../size_data.dart';
import '../widgets/book_description.dart';
import '../widgets/book_info.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    ref.watch(bookmarksProvider);

    return Scaffold(
      appBar: _buildAppBar(context, book: widget.book),
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
                      child: BookCard(book: widget.book),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: defaultSize * 3,
                  child: BookInfo(book: widget.book),
                ),
              ]),
            ),
            BookDescription(book: widget.book),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, {required Book book}) {
    final bookmarks = ref.read(bookmarksProvider);
    isBookmarked = bookmarks.contains(book);

    return AppBar(
      actions: [
        IconButton(
            onPressed: () => setState(() => isBookmarked =
                ref.read(bookmarksProvider.notifier).toggle(book)),
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
        widget.book.title,
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
