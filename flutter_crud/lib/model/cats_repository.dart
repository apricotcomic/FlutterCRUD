import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';

class CatsRepository {
  final DbHelper _dbHelper;
  CatsRepository(this._dbHelper);

  Future<List<Cats>> catList() async {
    return _dbHelper.selectAllCats();
  }
}
