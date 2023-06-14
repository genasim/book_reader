import 'package:book_reader/sevices/constants.dart';
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
                const CardsRow(
                  title: 'Your last reads ...',
                  widgets: cards,
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
                  (index) => CardsRow(title: genres[index], widgets: cards)),
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: SizedBox(
                  width: defaultSize * 2,
                  height: defaultSize * 2,
                  child: Icon(
                    Icons.more_horiz,
                    size: defaultSize * 2,
                  )))
        ],
      );
}
