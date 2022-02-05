import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_crud/view/cat_detail.dart';

final _initCats = Cats(
    id: 0,
    name: '',
    birthday: '',
    gender: '',
    memo: '',
    createdAt: DateTime.now());

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<CatList> {
  List<Cats> catList = [];
  bool isLoading = false;

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、初期処理としてCatsの全データを取得する。
  @override
  void initState() {
    super.initState();
    getCatsList();
  }

  Future getCatsList() async {
    setState(() => isLoading = true);
    catList = await DbHelper.instance.selectAllCats();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('猫一覧')),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              child: ListView.builder(
                itemCount: catList.length,
                itemBuilder: (BuildContext context, int index) {
                  final cat = catList[index];
                  return Card(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(cat.name),
                                  Row(
                                    children: [
                                      const Text('性別:'),
                                      Text(cat.gender),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => goToCatDetailScreen(context, _initCats),
      ),
    );
  }

  void goToCatDetailScreen(BuildContext context, Cats cat) {
    var route = MaterialPageRoute(
      settings: const RouteSettings(name: '/view.cat_detail'),
      builder: (BuildContext context) => CatDetail(id: cat.id),
    );
    Navigator.push(context, route);
    getCatsList();
  }
}
