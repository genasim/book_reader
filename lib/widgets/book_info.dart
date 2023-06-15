import 'package:flutter/material.dart';

import '../size_data.dart';

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
            'author ',
            style: productTextStyle,
          ),
          Divider(thickness: defaultSize * 0.2),
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
