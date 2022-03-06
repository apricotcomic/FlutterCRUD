import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_crud/view/cat_list_entity.dart';
import 'package:flutter_crud/model/cats_repository.dart';

class CatListViewModel extends StateNotifier<AsyncValue<CatListEntity>> {
  CatListViewModel(this._catsRepository) : super(const AsyncValue.loading()) {
    catListRepositories();
  }

  final CatsRepository _catsRepository;

  Future<void> catListRepositories() async {
    state = const AsyncValue.loading();
    try {
      final catList = await _catsRepository.catList();
      CatListEntity? catListEntity;
      List<String> catListName = [];
      for (int i = 0; i < catList.length; i++) {
        catListName[i] = catList[i].name;
      }
      catListEntity!.copyWith(name: catListName);
      state = AsyncValue.data(catListEntity);
      }  on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
