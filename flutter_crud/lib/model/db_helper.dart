import 'package:flutter_crud/model/cats.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const List<String> cats = [
  'id',
  'name',
  'gender',
  'birthday',
  'memo',
  'createdAt',
];

class DbHelper {
  // DbHelperをinstance化する
  static final DbHelper instance = DbHelper._createInstance();
  static Database? _database;

  DbHelper._createInstance();

  Future<Database> get database async {
    return _database ??= await _initDB();
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'cats.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      '''
          CREATE TABLE cats(
            id int PRIMARY KEY,
            name TEXT,
            gender TEXT,
            birthday TEXT,
            memo TEXT,
            createdAt TEXT
          )
        ''';
    });
  }

  Future<List<Cats>> selectAllCats() async {
    final db = await database;
    final List<Map<String, dynamic>> catsData = await db.query('cats');
    if (catsData.isEmpty) return [];

    return List.generate(catsData.length, (index) {
      return Cats(
        id: catsData[index]["id"],
        name: catsData[index]["name"],
        gender: catsData[index]["gender"],
        birthday: catsData[index]["birthday"],
        memo: catsData[index]["memo"],
        createdAt: catsData[index]["createdAt"],
      );
    });
  }

  Future<Cats> catData(int id) async {
    final db = await instance.database;
    var cat = [];
    cat = await db.query(
      'cats',
      columns: cats,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (cat.isNotEmpty) {
      return Cats.fromJson(cat.first);
    } else {
      return Cats(
        id: 0,
        name: '',
        birthday: '',
        gender: '',
        memo: '',
        createdAt: DateTime.now());
    }
  }

  Future insert(Cats cats) async {
    final db = await database;
    return await db.insert(
      'cats',
      toMap(cats),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future update(Cats cats) async {
    final db = await database;
    return await db.update(
      'cats',
      toMap(cats),
      where: 'id = ?',
      whereArgs: [cats.id],
    );
  }

  Future delete(int id) async {
    final db = await database;
    return await db.delete(
      'cats',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> toMap(Cats cats) {
    return {
      'id': cats.id,
      'name': cats.name,
      'gender': cats.gender,
      'birthday': cats.birthday,
      'memo': cats.memo,
      'createdAt': cats.createdAt.toUtc().toIso8601String(),
    };
  }

  Cats fromMap(Map<String, dynamic> json) {
    return Cats(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      birthday: json['birthday'],
      memo: json['memo'],
      createdAt: json['createdAt'],
    );
  }
}
