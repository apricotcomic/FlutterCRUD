import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_crud/view/cat_detail_view_model.dart';

// ignore: must_be_immutable
class CatDetail extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  late final Cats _cat;

  CatDetail(this._cat, {Key? key}) : super(key: key);

  var dphelper = DbHelper();
  CatDetailViewModel vm = CatDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('猫詳細'),
          actions: [
            IconButton(
              onPressed: () => _save(),
              icon: const Icon(Icons.save),
            ),
            IconButton(
              onPressed: () => _delete(),
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: SafeArea(
            child: Form(
                key: _globalKey,
                child: ListView(padding: const EdgeInsets.all(15), children: [
                  Column(children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/icon/noimage.jpg'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '名前'),
                      initialValue: _cat.name,
                      validator: (value) =>
                          (value!.isEmpty) ? '名前を入力してください' : null,
                      onChanged: (value) => vm.setName(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: '誕生日'),
                        onChanged: (value) => vm.setBirthday(value),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: '性別'),
                        onChanged: (value) => vm.setGender(value),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'メモ'),
                        onChanged: (value) => vm.setMemo(value),
                      ),
                    ),
                  ])
                ]))));
  }

  Future _save() async {
    _cat.createdAt = DateTime.now();
    return await dphelper.update(_cat);
  }

  Future _delete() async => dphelper.delete(_cat);
}
