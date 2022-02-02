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

Future<List<Cats>> getCatsList() async {
  var dbhelper = DbHelper();
  Future<List<Cats>> catList = dbhelper.selectAllCats();
  return catList;
}

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  CatListPageState createState() => CatListPageState();
}

class CatListPageState extends State<CatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('猫一覧')),
      body: FutureBuilder<List<Cats>>(
        future: getCatsList(),
        builder:(context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(snapshot.data![index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 18.0)
                      )
                    ]
                  );
                }
              );
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: const CircularProgressIndicator(),
            );
        }
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
      builder: (BuildContext context) => CatDetail(cat),
    );
    Navigator.push(context, route);
  }
}
