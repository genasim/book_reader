import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/book.dart';
import 'repository_provider.dart';

class BookmarksNotifier extends StateNotifier<List<Book>> {
  BookmarksNotifier({required Repository repository})
      : super(repository.bookmarks);

  bool toggle(Book book) {
    final tempList = List<Book>.from(state, growable: true);

    if (state.contains(book)) {
      state = tempList..remove(book);
      return false;
    }

    state = tempList..add(book);
    return true;
  }
}

final bookmarksNotifier = StateNotifierProvider<BookmarksNotifier, List<Book>>(
    (ref) => BookmarksNotifier(repository: ref.read(repositoryProvider)));
