import 'package:flutter_crud/model/cats.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'cats.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    String sql = '''
      CREATE TABLE cats(
        id int PRIMARY KEY,
        name TEXT,
        gender TEXT,
        birthday TEXT,
        memo TEXT,
        createdAt TEXT
      )
    ''';
    return await db.execute(sql);
  }

  Future<List<Cats>> selectAllCats() async {
    final db = await database;
    var catsData = await db.query('cats');
    if (catsData.isEmpty) return [];

    return catsData.map((map) => fromMap(map)).toList();
  }

  Future insert(Cats cats) async {
    final db = await database;
    return await db.insert('cats', toMap(cats));
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

  Future delete(Cats cats) async {
    final db = await database;
    return await db.delete(
      'cats',
      where: 'id = ?',
      whereArgs: [cats.id],
    );
  }

  Map<String, dynamic> toMap(Cats cats) {
    return {
      'id': cats.id,
      'name': cats.name,
      'gender': cats.gender,
      'birthday': cats.birthday,
      'memo': cats.memo,
      'createdAt': cats.createdAt,
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
