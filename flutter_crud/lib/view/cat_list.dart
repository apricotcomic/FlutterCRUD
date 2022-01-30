import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/view/cat_detail.dart';
import 'package:flutter_crud/model/cat_repository.dart';

class CatList extends StatelessWidget {
  final _initCats = Cats(
      id: 0,
      name: '',
      birthday: '',
      gender: '',
      memo: '',
      createdAt: DateTime.now());

  @override
  Widget build(BuildContext context) {
    //final vm = CatListViewModel(CatRepository(DbHelper()));
    final page = _CatListPage();
    return Scaffold(
      appBar: AppBar(title: Text('猫一覧')),
      body: page,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => page.goToCatDetailScreen(context, _initCats),
      ),
    );
  }
}

class _CatListPage extends StatelessWidget {
  late final CatRepository _repository;
  List<Cats> _catList = [];

  Future<void> initCatsList() async {
    _catList = await _repository.catSelectAll();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _catList.length,
      itemBuilder: (BuildContext context, int index) {
        var cat = _catList[index];
        return _buildCatListTile(context, cat);
      },
    );
  }

  Widget _buildCatListTile(BuildContext context, Cats cat) {
    return Card(
      child: ListTile(
        title: Text(cat.name),
        onTap: () => goToCatDetailScreen(context, cat),
      ),
    );
  }

  void goToCatDetailScreen(BuildContext context, Cats cat) {
    var route = MaterialPageRoute(
      settings: RouteSettings(name: '/view.cat_detail'),
      builder: (BuildContext context) => CatDetail(cat),
    );
    Navigator.push(context, route);
  }
}
