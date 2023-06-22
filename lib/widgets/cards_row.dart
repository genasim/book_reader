import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';
import '../size_data.dart';
import 'book_card.dart';

class CardsRow extends StatelessWidget {
  const CardsRow({
    super.key,
    required this.title,
    required this.books,
  });

  final String title;
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: defaultSize * 0.8,
          bottom: defaultSize * 1.5,
          left: defaultSize * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: defaultSize),
            child: Text(
              title,
              style: TextStyle(
                  letterSpacing: defaultSize * 0.18,
                  fontSize: defaultSize * 1.3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: _createRowElements(context)),
          )
        ],
      ),
    );
  }

  List<Widget> _createRowElements(BuildContext context) {
    return books
        .map((book) => Padding(
            padding: EdgeInsets.only(left: defaultSize * 0.5),
            child: SizedBox(
              width: defaultSize * 8,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: InkWell(
                    onTap: () => context.push('/details', extra: book),
                    child: BookCard(book: book)),
              ),
            )))
        .toList(growable: true)
      ..add(_arrowWidget);
  }
}

final _arrowWidget = Padding(
  padding: EdgeInsets.only(left: defaultSize * 0.5),
  child: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_forward_ios,
        size: defaultSize * 4.5,
      )),
);
