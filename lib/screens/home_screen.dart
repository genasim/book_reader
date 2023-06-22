import 'package:book_reader/sevices/mock_constants.dart';
import 'package:book_reader/size_data.dart';
import 'package:flutter/material.dart';

import '../widgets/cards_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                CardsRow(
                  title: 'Your last reads ...',
                  books: books,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultSize * 4),
                  child: Divider(
                    color: Theme.of(context).primaryColor,
                    height: defaultSize,
                    thickness: defaultSize * 0.3,
                  ),
                )
              ] +
              List.generate(genres.length,
                  (index) => CardsRow(title: genres[index], books: books)),
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
