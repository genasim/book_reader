import 'package:flutter/material.dart';

import '../size_data.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultSize * 0.001),
      child: SizedBox(
        width: defaultSize * 8,
        height: defaultSize * 12,
        child: Container(
          margin: EdgeInsets.only(left: defaultSize * 1.3),
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
