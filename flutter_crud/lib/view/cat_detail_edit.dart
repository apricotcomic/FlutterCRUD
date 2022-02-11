import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';

class CatDetailEdit extends StatefulWidget {
  final Cats? cats;

  const CatDetailEdit({Key? key, this.cats}) : super(key: key);

  @override
  _CatDetailEditState createState() => _CatDetailEditState();
}

class _CatDetailEditState extends State<CatDetailEdit> {
  late int id;
  late String name;
  late String birthday;
  late String gender;
  late String memo;
  late DateTime createdAt;
  final List<String> _list = <String>['男の子', '女の子', '不明'];     // 性別のDropdownの項目を設定
  late String _selected;                                              // Dropdownの初期値
  String value = '不明';                                              // Dropdownの初期値

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、各項目の初期値を設定する
  @override
  void initState() {
    super.initState();
    id = widget.cats?.id ?? 0;
    name = widget.cats?.name ?? '';
    birthday = widget.cats?.birthday ?? '';
    gender = widget.cats?.gender ?? '';
    _selected  = widget.cats?.gender ?? '不明';
    memo = widget.cats?.memo ?? '';
    createdAt = widget.cats?.createdAt ?? DateTime.now();
  }

// Dropdownの値の変更を行う
  void _onChanged(String? value) {
    setState(() {
      _selected = value!;
      gender = _selected;
    });
  }

// 詳細編集画面を表示する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('猫編集'),
        actions: [
          buildSaveButton(), // 保存ボタンを表示する
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Row(children: [                                             // 名前の行の設定
            const Expanded(child:
              Text('名前'),                                           // 見出し
            ),
            Expanded(child: 
              TextFormField(
                maxLines: 1,
                initialValue: name,
                decoration: const InputDecoration(
                  hintText: '名前を入力してください',
                ),
                validator: (name) => name != null && name.isEmpty
                    ? '名前は必ず入れてね'
                    : null, // validateを設定
                onChanged: (name) => setState(() => this.name = name),
              ),
            ),
          ]),
          Row(children: [
            const Expanded(child:
              Text('誕生日'),
            ),
            Expanded(child: 
              TextFormField(
                maxLines: 1,
                initialValue: birthday,
                decoration: const InputDecoration(
                  hintText: '誕生日を入力してください',
                ),
                onChanged: (birthday) => setState(() => this.birthday = birthday),
              ),
            ),
          ]),
          Row(children:[
            const Expanded(child: 
              Text('性別'),
            ),
            Expanded(child:
              DropdownButton(
                items: _list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _selected,
                onChanged: _onChanged,
              ),
            ),
          ]),
          Row(children:[
            const Expanded(child: 
              Text('メモ')
            ),
            Expanded(child: 
              TextFormField(
                maxLines: 1,
                initialValue: memo,
                decoration: const InputDecoration(
                  hintText: 'メモを入力してください',
                ),
                onChanged: (memo) => setState(() => this.memo = memo),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

// 保存ボタンの設定
  Widget buildSaveButton() {
    final isFormValid = name.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Text('保存'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? Colors.redAccent : Colors.grey.shade700,
        ),
        onPressed: createOrUpdateCat, // 保存ボタンを押したら実行する処理を指定する
      ),
    );
  }

// 保存ボタンを押したとき実行する処理
  void createOrUpdateCat() async {
    final isUpdate = (widget.cats != null);

    if (isUpdate) {
      await updateCat();
    } else {
      await createCat();
    }

    Navigator.of(context).pop();
  }

  Future updateCat() async {
    final cat = widget.cats!.copy(
      name: name,
      birthday: birthday,
      gender: gender,
      memo: memo,
    );

    await DbHelper.instance.update(cat);
  }

  Future createCat() async {
    final cat = Cats(
      name: name,
      birthday: birthday,
      gender: gender,
      memo: memo,
      createdAt: createdAt,
    );
    await DbHelper.instance.insert(cat);
  }
}
