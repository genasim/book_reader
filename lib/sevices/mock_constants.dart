import '../models/book.dart';

List<Book> books = List.generate(6, (index) => Book.mock());

List<Book> manyBooks = List.generate(10, (index) => Book.mock());

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

