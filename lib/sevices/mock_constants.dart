import 'package:book_reader/models/book.dart';
import 'package:book_reader/widgets/book_card.dart';
import 'package:flutter/material.dart';

List<Widget> cards =
    List.generate(6, (index) => const BookCard(book: book_mock));

List<Widget> manyCards =
    List.generate(10, (index) => const BookCard(book: book_mock));

const List<String> genres = [
  'Action',
  'Thriller',
  'Drama',
  'Science Fiction',
  'Horror',
  'Psychological'
];

const textPlaceholder =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

const book_mock = Book(
  title: 'The Great Gatsby',
  author: 'F. Scott Fitzgerald',
  year: 1925,
  imageURL:
      'https://i0.wp.com/americanwritersmuseum.org/wp-content/uploads/2018/02/CK-3.jpg?resize=267%2C400&ssl=1',
);
