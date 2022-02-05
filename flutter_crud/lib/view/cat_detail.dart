import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_crud/view/cat_detail_edit.dart';

class CatDetail extends StatefulWidget {
  final int id;

  const CatDetail({Key? key, required this.id}) : super(key: key);

  @override
  _CatDetailState createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {
  late Cats cats;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    catData();
  }

  Future catData() async {
    setState(() => isLoading = true);
    cats = await DbHelper.instance.catData(widget.id);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('猫詳細'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CatDetailEdit(
                    cats: cats,
                  ),
                ),
              );
              catData();
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () async {
              await DbHelper.instance.delete(widget.id);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: const Text('名前'),
                    color: Colors.grey[300],
                    height: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(cats.name),
                  ),
                  Container(
                    child: const Text('性別'),
                    color: Colors.grey[300],
                    height: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(cats.gender),
                  ),
                  Container(
                    child: const Text('誕生日'),
                    color: Colors.grey[300],
                    height: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(cats.birthday),
                  ),
                  Container(
                    child: const Text('メモ'),
                    color: Colors.grey[300],
                    height: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(cats.memo),
                  ),
                ],
              ),
            ),
    );
  }
}
