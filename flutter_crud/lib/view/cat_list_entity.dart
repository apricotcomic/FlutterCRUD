import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_list_entity.freezed.dart';
part 'cat_list_entity.g.dart';

@freezed
abstract class CatListEntity with _$CatListEntity {
  const factory CatListEntity ({
    @Default([]) List<String>? name,
  }) = _CatListEntity;
  factory CatListEntity.fromJson(Map<String, dynamic> json) => _$CatListEntityFromJson(json);
}