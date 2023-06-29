import '../sevices/mock_constants.dart';

var _counter = 0;

class Book {
  final String title;
  final String author;
  final int year;
  final String imageURL;
  final String description;
  final String genre;
  final int id;

  const Book({
    required this.title,
    required this.author,
    required this.year,
    required this.imageURL,
    required this.genre,
    this.description = textPlaceholder,
    this.id = 0,
  });

  factory Book.mock() => Book(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        year: 1925,
        imageURL:
            'https://i0.wp.com/americanwritersmuseum.org/wp-content/uploads/2018/02/CK-3.jpg?resize=267%2C400&ssl=1',
        genre: 'fantasy',
        description: textPlaceholder,
        id: _counter++,
      );
}
