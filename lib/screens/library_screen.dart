import 'package:book_reader/sevices/mock_constants.dart';
import 'package:book_reader/widgets/book_card.dart';
import 'package:book_reader/widgets/cards_row.dart';
import 'package:flutter/material.dart';

import '../size_data.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardsRow(title: 'Bookmarks', widgets: cards),
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
                children: manyCards
                    .map((e) => SizedBox(
                          width: defaultSize * 8.5,
                          child: const AspectRatio(
                            aspectRatio: 2 / 3,
                            child: BookCard(),
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                size: defaultSize * 2,
              ))
        ],
      );
}
