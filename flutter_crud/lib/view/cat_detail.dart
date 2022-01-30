import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/cat_repository.dart';

class CatDetail extends StatelessWidget {
  late final Cats _cat;

  CatDetail(this._cat);

  late final CatRepository _repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('猫詳細'),
        actions: [
          IconButton(
            onPressed: () => _save(),
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () => _delete(),
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Future _save() async {
    _cat.createdAt = DateTime.now();
    return await _repository.update(_cat);
  }

  Future _delete() async => _repository.delete(_cat);

}
