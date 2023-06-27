import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/book.dart';

class BookmarksNotifier extends StateNotifier<List<Book>> {
  BookmarksNotifier(super.state);

  bool toggle(Book book) {
    if (state.contains(book)) {
      state.remove(book);
      return false;
    }

    state.add(book);
    return true;
  }
}

final bookmarksProvider = StateNotifierProvider<BookmarksNotifier, List<Book>>(
    (ref) => BookmarksNotifier(List<Book>.empty(growable: true)));
