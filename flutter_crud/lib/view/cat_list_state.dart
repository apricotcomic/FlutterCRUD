import 'package:flutter/foundation.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_list_state.freezed.dart';

@freezed
abstract class CatListState with _$CatListState {
  const factory CatListState({
    @Default(<Cats>[]) List<Cats> cats,
  }) = _CatListData;
  const factory CatListState.loading() = CatListLoading;
}
