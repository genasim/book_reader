import 'package:flutter/material.dart';

import '../models/book.dart';
import '../size_data.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
    required this.book,
  });

  final Book book;

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
            book.description,
            style: descriptionStyle,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: defaultSize * 4),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.book,
            ),
            onPressed: () {},
            label: SizedBox(
                width: defaultSize * 30,
                child: Text(
                  'Start Reading!',
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
