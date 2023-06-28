import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/book.dart';

class Repository {
  final _bookmarks = List<Book>.empty(growable: true);
  List<Book> get bookmarks => List.from(_bookmarks, growable: false);

  final _library = List<Book>.empty(growable: true);
  List<Book> get library => List.from(_library, growable: false);
}

final repositoryProvider = Provider((ref) => Repository());
