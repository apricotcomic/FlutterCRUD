import 'package:flutter_crud/model/cats.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String columnId = '_id';
const String columnName = 'name';
const String columnGender = 'gender';
const String columnBirthday = 'birthday';
const String columnMemo = 'memo';
const String columnCreatedAt = 'createdAt';

const List<String> columns = [
  columnId,
  columnName,
  columnGender,
  columnBirthday,
  columnMemo,
  columnCreatedAt,
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

    return await openDatabase(
      path, 
      version: 1, 
      onCreate: _onCreate,
    );
  }
  
  Future _onCreate(Database database, int version) async {
      
    await database.execute('''
      CREATE TABLE cats(
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        gender TEXT,
        birthday TEXT,
        memo TEXT,
        createdAt TEXT
      )
    ''');
  }

  Future<List<Cats>> selectAllCats() async {
    final db = await instance.database;
    final catsData = await db.query('cats');
    if (catsData.isEmpty) return [];

    return catsData.map((json) => Cats.fromJson(json)).toList();
  }

  Future<Cats> catData(int id) async {
    final db = await instance.database;
    var cat = [];
    cat = await db.query(
      'cats',
      columns: columns,
      where: '_id = ?',
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
      cats.toJson()
      );
  }

  Future update(Cats cats) async {
    final db = await database;
    return await db.update(
      'cats',
      cats.toJson(),
      where: '_id = ?',
      whereArgs: [cats.id],
    );
  }

  Future delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'cats',
      where: '_id = ?',
      whereArgs: [id],
    );
  }
}
