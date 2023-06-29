import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';
import '../size_data.dart';
import '../widgets/book_card.dart';

class LibraryCollection extends StatelessWidget {
  const LibraryCollection({
    super.key,
    required this.collection,
  });

  final List<Book> collection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: defaultSize),
            child: Text(
              'My library collection',
              style: TextStyle(
                  letterSpacing: defaultSize * 0.18,
                  fontSize: defaultSize * 1.8,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            runSpacing: defaultSize * 0.5,
            spacing: defaultSize * 0.5,
            children: collection
                .map((book) => SizedBox(
                      width: defaultSize * 8.5,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: InkWell(
                            onTap: () => context.push('/details', extra: book),
                            child: BookCard(book: book)),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
