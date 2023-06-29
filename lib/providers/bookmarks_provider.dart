import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/book.dart';
import 'repository_provider.dart';

class BookmarksNotifier extends StateNotifier<List<Book>> {
  BookmarksNotifier({required Repository repository})
      : super(repository.bookmarks);

  void toggle(Book book) {
    final tempList = List<Book>.from(state, growable: true);

    if (tempList.contains(book)) {
      tempList.remove(book);
    } else {
      tempList.add(book);
    }

    state = List.from(tempList, growable: false);
  }
}

final bookmarksNotifier = StateNotifierProvider<BookmarksNotifier, List<Book>>(
    (ref) => BookmarksNotifier(repository: ref.read(repositoryProvider)));
