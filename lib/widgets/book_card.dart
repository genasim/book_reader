import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.amberAccent,
      child: const Center(child: Text('Book Cover')),
    );
  }
}
