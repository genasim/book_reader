import 'package:book_reader/sevices/mock_constants.dart';
import 'package:book_reader/widgets/book_card.dart';
import 'package:flutter/material.dart';

import '../size_data.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
                      child: BookCard(),
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

  AppBar _buildAppBar() => AppBar(
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
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              size: defaultSize * 2,
            )),
      );
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productTextStyle = TextStyle(
      letterSpacing: -0.5,
      fontWeight: FontWeight.bold,
      fontSize: defaultSize * 1.7,
    );

    return Container(
      height: defaultSize * 30,
      width: defaultSize * 11.5,
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'author',
            style: productTextStyle,
          ),
          const Divider(),
          SizedBox(height: defaultSize * 4),
          Text(
            'year',
            style: productTextStyle,
          ),
          SizedBox(height: defaultSize),
          Text(
            'genre',
            style: productTextStyle,
          ),
        ],
      ),
    );
  }
}

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionStyle = TextStyle(
      fontSize: defaultSize * 1.2,
      height: 1.6,
    );

    final buttonTextStyle = TextStyle(
      letterSpacing: defaultSize * 0.3,
      fontSize: defaultSize * 1.2,
    );

    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 30),
      padding: EdgeInsets.only(
        top: defaultSize * 6,
        right: defaultSize * 3,
        left: defaultSize * 3,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 3),
              topRight: Radius.circular(defaultSize * 3))),
      child: Column(
        children: [
          SizedBox(height: defaultSize * 2),
          Text(
            textPlaceholder,
            style: descriptionStyle,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: defaultSize * 4),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            label: SizedBox(
                width: defaultSize * 30,
                child: Text(
                  'Add to cart!',
                  style: buttonTextStyle,
                  textAlign: TextAlign.center,
                )),
          ),
          SizedBox(height: defaultSize * 1.5)
        ],
      ),
    );
  }
}
