import 'package:flutter_crud/view/cat_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catListModelProvider = StateNotifierProvider((ref) => CatListNotifier());

class CatListNotifier extends StateNotifier<List<CatListState>> {
  CatListNotifier(): super([]);

  void catlist(CatListState catListState) {
    state = [...state, catListState];
  }

}

final catListProvider = StateNotifierProvider<CatListNotifier, List<CatListState>>((ref) {
  return CatListNotifier();
});
