import 'package:book_reader/widgets/book_card.dart';
import 'package:flutter/material.dart';

const List<Widget> cards = [
  BookCard(),
  BookCard(),
  BookCard(),
  BookCard(),
  BookCard(),
  BookCard(),
];

List<Widget> manyCards = List.generate(10, (index) => BookCard());

const List<String> genres = [
  'Action',
  'Thriller',
  'Drama',
  'Science Fiction',
  'Horror',
  'Psychological'
];
