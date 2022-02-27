// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cat_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CatListStateTearOff {
  const _$CatListStateTearOff();

  _CatListData call({List<Cats> cats = const <Cats>[]}) {
    return _CatListData(
      cats: cats,
    );
  }

  CatListLoading loading() {
    return const CatListLoading();
  }
}

/// @nodoc
const $CatListState = _$CatListStateTearOff();

/// @nodoc
mixin _$CatListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Cats> cats) $default, {
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Cats> cats)? $default, {
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Cats> cats)? $default, {
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CatListData value) $default, {
    required TResult Function(CatListLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_CatListData value)? $default, {
    TResult Function(CatListLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CatListData value)? $default, {
    TResult Function(CatListLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatListStateCopyWith<$Res> {
  factory $CatListStateCopyWith(
          CatListState value, $Res Function(CatListState) then) =
      _$CatListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CatListStateCopyWithImpl<$Res> implements $CatListStateCopyWith<$Res> {
  _$CatListStateCopyWithImpl(this._value, this._then);

  final CatListState _value;
  // ignore: unused_field
  final $Res Function(CatListState) _then;
}

/// @nodoc
abstract class _$CatListDataCopyWith<$Res> {
  factory _$CatListDataCopyWith(
          _CatListData value, $Res Function(_CatListData) then) =
      __$CatListDataCopyWithImpl<$Res>;
  $Res call({List<Cats> cats});
}

/// @nodoc
class __$CatListDataCopyWithImpl<$Res> extends _$CatListStateCopyWithImpl<$Res>
    implements _$CatListDataCopyWith<$Res> {
  __$CatListDataCopyWithImpl(
      _CatListData _value, $Res Function(_CatListData) _then)
      : super(_value, (v) => _then(v as _CatListData));

  @override
  _CatListData get _value => super._value as _CatListData;

  @override
  $Res call({
    Object? cats = freezed,
  }) {
    return _then(_CatListData(
      cats: cats == freezed
          ? _value.cats
          : cats // ignore: cast_nullable_to_non_nullable
              as List<Cats>,
    ));
  }
}

/// @nodoc

class _$_CatListData with DiagnosticableTreeMixin implements _CatListData {
  const _$_CatListData({this.cats = const <Cats>[]});

  @JsonKey()
  @override
  final List<Cats> cats;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CatListState(cats: $cats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CatListState'))
      ..add(DiagnosticsProperty('cats', cats));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CatListData &&
            const DeepCollectionEquality().equals(other.cats, cats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(cats));

  @JsonKey(ignore: true)
  @override
  _$CatListDataCopyWith<_CatListData> get copyWith =>
      __$CatListDataCopyWithImpl<_CatListData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Cats> cats) $default, {
    required TResult Function() loading,
  }) {
    return $default(cats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Cats> cats)? $default, {
    TResult Function()? loading,
  }) {
    return $default?.call(cats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Cats> cats)? $default, {
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(cats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CatListData value) $default, {
    required TResult Function(CatListLoading value) loading,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_CatListData value)? $default, {
    TResult Function(CatListLoading value)? loading,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CatListData value)? $default, {
    TResult Function(CatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CatListData implements CatListState {
  const factory _CatListData({List<Cats> cats}) = _$_CatListData;

  List<Cats> get cats;
  @JsonKey(ignore: true)
  _$CatListDataCopyWith<_CatListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatListLoadingCopyWith<$Res> {
  factory $CatListLoadingCopyWith(
          CatListLoading value, $Res Function(CatListLoading) then) =
      _$CatListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CatListLoadingCopyWithImpl<$Res>
    extends _$CatListStateCopyWithImpl<$Res>
    implements $CatListLoadingCopyWith<$Res> {
  _$CatListLoadingCopyWithImpl(
      CatListLoading _value, $Res Function(CatListLoading) _then)
      : super(_value, (v) => _then(v as CatListLoading));

  @override
  CatListLoading get _value => super._value as CatListLoading;
}

/// @nodoc

class _$CatListLoading with DiagnosticableTreeMixin implements CatListLoading {
  const _$CatListLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CatListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CatListState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CatListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Cats> cats) $default, {
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Cats> cats)? $default, {
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Cats> cats)? $default, {
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CatListData value) $default, {
    required TResult Function(CatListLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_CatListData value)? $default, {
    TResult Function(CatListLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CatListData value)? $default, {
    TResult Function(CatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CatListLoading implements CatListState {
  const factory CatListLoading() = _$CatListLoading;
}
