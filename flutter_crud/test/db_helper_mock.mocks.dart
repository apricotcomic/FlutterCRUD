// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_crud/test/db_helper_mock.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:flutter_crud/model/cats.dart' as _i3;
import 'package:flutter_crud/model/db_helper.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDatabase_0 extends _i1.Fake implements _i2.Database {}

class _FakeCats_1 extends _i1.Fake implements _i3.Cats {}

/// A class which mocks [DbHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDbHelper extends _i1.Mock implements _i4.DbHelper {
  MockDbHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Database> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i2.Database>.value(_FakeDatabase_0()))
          as _i5.Future<_i2.Database>);
  @override
  _i5.Future<List<_i3.Cats>> selectAllCats() =>
      (super.noSuchMethod(Invocation.method(#selectAllCats, []),
              returnValue: Future<List<_i3.Cats>>.value(<_i3.Cats>[]))
          as _i5.Future<List<_i3.Cats>>);
  @override
  _i5.Future<_i3.Cats> catData(int? id) =>
      (super.noSuchMethod(Invocation.method(#catData, [id]),
              returnValue: Future<_i3.Cats>.value(_FakeCats_1()))
          as _i5.Future<_i3.Cats>);
  @override
  _i5.Future<dynamic> insert(_i3.Cats? cats) =>
      (super.noSuchMethod(Invocation.method(#insert, [cats]),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> update(_i3.Cats? cats) =>
      (super.noSuchMethod(Invocation.method(#update, [cats]),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
}
