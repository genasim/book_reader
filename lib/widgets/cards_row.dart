import 'package:flutter/material.dart';

import '../size_data.dart';
import 'book_card.dart';

class CardsRow extends StatelessWidget {
  const CardsRow({
    super.key,
    required this.title,
    required this.widgets,
  });

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: defaultSize * 0.8, bottom: defaultSize * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: defaultSize * 2, bottom: defaultSize),
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
            child: Row(
              children: List.generate(widgets.length + 1, (index) {
                if (index == widgets.length) {
                  return Padding(
                    padding: EdgeInsets.only(left: defaultSize * 0.5),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: defaultSize * 4.5,
                        )),
                  );
                }

                return const BookCard();
              }),
            ),
          )
        ],
      ),
    );
  }
}
