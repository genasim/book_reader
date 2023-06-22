import '../sevices/mock_constants.dart';

class Book {
  final String title;
  final String author;
  final int year;
  final String imageURL;
  final String description;
  final String genre;

  const Book({
    required this.title,
    required this.author,
    required this.year,
    required this.imageURL,
    required this.genre,
    this.description = textPlaceholder,
  });
}
