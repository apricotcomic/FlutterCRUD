// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cat_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CatListEntity _$CatListEntityFromJson(Map<String, dynamic> json) {
  return _CatListEntity.fromJson(json);
}

/// @nodoc
class _$CatListEntityTearOff {
  const _$CatListEntityTearOff();

  _CatListEntity call({List<String>? name = const []}) {
    return _CatListEntity(
      name: name,
    );
  }

  CatListEntity fromJson(Map<String, Object?> json) {
    return CatListEntity.fromJson(json);
  }
}

/// @nodoc
const $CatListEntity = _$CatListEntityTearOff();

/// @nodoc
mixin _$CatListEntity {
  List<String>? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatListEntityCopyWith<CatListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatListEntityCopyWith<$Res> {
  factory $CatListEntityCopyWith(
          CatListEntity value, $Res Function(CatListEntity) then) =
      _$CatListEntityCopyWithImpl<$Res>;
  $Res call({List<String>? name});
}

/// @nodoc
class _$CatListEntityCopyWithImpl<$Res>
    implements $CatListEntityCopyWith<$Res> {
  _$CatListEntityCopyWithImpl(this._value, this._then);

  final CatListEntity _value;
  // ignore: unused_field
  final $Res Function(CatListEntity) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$CatListEntityCopyWith<$Res>
    implements $CatListEntityCopyWith<$Res> {
  factory _$CatListEntityCopyWith(
          _CatListEntity value, $Res Function(_CatListEntity) then) =
      __$CatListEntityCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? name});
}

/// @nodoc
class __$CatListEntityCopyWithImpl<$Res>
    extends _$CatListEntityCopyWithImpl<$Res>
    implements _$CatListEntityCopyWith<$Res> {
  __$CatListEntityCopyWithImpl(
      _CatListEntity _value, $Res Function(_CatListEntity) _then)
      : super(_value, (v) => _then(v as _CatListEntity));

  @override
  _CatListEntity get _value => super._value as _CatListEntity;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_CatListEntity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CatListEntity implements _CatListEntity {
  const _$_CatListEntity({this.name = const []});

  factory _$_CatListEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CatListEntityFromJson(json);

  @JsonKey()
  @override
  final List<String>? name;

  @override
  String toString() {
    return 'CatListEntity(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CatListEntity &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$CatListEntityCopyWith<_CatListEntity> get copyWith =>
      __$CatListEntityCopyWithImpl<_CatListEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatListEntityToJson(this);
  }
}

abstract class _CatListEntity implements CatListEntity {
  const factory _CatListEntity({List<String>? name}) = _$_CatListEntity;

  factory _CatListEntity.fromJson(Map<String, dynamic> json) =
      _$_CatListEntity.fromJson;

  @override
  List<String>? get name;
  @override
  @JsonKey(ignore: true)
  _$CatListEntityCopyWith<_CatListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
