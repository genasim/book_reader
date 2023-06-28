import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/book.dart';
import 'repository_provider.dart';

class LibraryNotifier extends StateNotifier<List<Book>> {
  LibraryNotifier({required Repository repository})
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

final libraryNotifier = StateNotifierProvider<LibraryNotifier, List<Book>>(
    (ref) => LibraryNotifier(repository: ref.read(repositoryProvider)));
