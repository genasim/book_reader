import 'package:book_reader/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../sevices/mock_constants.dart';
import '../size_data.dart';
import '../widgets/book_description.dart';
import '../widgets/book_info.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
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
                    child: const AspectRatio(
                      aspectRatio: 8 / 12,
                      child: BookCard(book: book_mock),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: defaultSize * 3,
                  child: const BookInfo(),
                ),
              ]),
            ),
            const BookDescription(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                size: defaultSize * 2,
              ))
        ],
        title: Text(
          'Book Title',
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
