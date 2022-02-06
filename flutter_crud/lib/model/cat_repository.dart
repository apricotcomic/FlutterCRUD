import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_crud/model/cats.dart';

class CatRepository {
  final DbHelper _dbHelper;

  CatRepository(this._dbHelper);

  Future<List<Cats>> catSelectAll() => _dbHelper.selectAllCats();

  Future insert(Cats cats) => _dbHelper.insert(cats);

  Future update(Cats cats) => _dbHelper.update(cats);

  Future delete(Cats cats) => _dbHelper.delete(cats.id!);
}
