import 'package:flutter/material.dart';

import '../size_data.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: defaultSize * 8,
      height: defaultSize * 12,
      child: Container(
        color: Colors.amberAccent,
      ),
    );
  }
}
