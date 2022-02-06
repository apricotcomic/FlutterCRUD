import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_crud/view/cat_detail_edit.dart';

// catsテーブルの中の1件のデータに対する操作を行うクラス
class CatDetail extends StatefulWidget {
  final int id;

  const CatDetail({Key? key, required this.id}) : super(key: key);

  @override
  _CatDetailState createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {
  late Cats cats;
  bool isLoading = false;

// Stateのサブクラスを作成し、initStateをオーバーライドすると、wedgit作成時に処理を動かすことができる。
// ここでは、渡されたidをキーとしてcatsテーブルからデータを取得する
  @override
  void initState() {
    super.initState();
    catData();
  }

// initStateで動かす処理
// catsテーブルから指定されたidのデータを1件取得する
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
            onPressed: () async {                          // 鉛筆のアイコンが押されたときの処理を設定
              await Navigator.of(context).push(            // ページ遷移をNavigatorで設定
                MaterialPageRoute(
                  builder: (context) => CatDetailEdit(    // 詳細更新画面を表示する
                    cats: cats,
                  ),
                ),
              );
              catData();                                  // 更新後のデータを読み込む
            },
            icon: const Icon(Icons.edit),                 // 鉛筆マークのアイコンを表示
          ),
          IconButton(
            onPressed: () async {                         // ゴミ箱のアイコンが押されたときの処理を設定
              await DbHelper.instance.delete(widget.id);  // 指定されたidのデータを削除する
              Navigator.of(context).pop();                // 削除後に前の画面に戻る
            },
            icon: const Icon(Icons.delete),               // ゴミ箱マークのアイコンを表示
          )
        ],
      ),
      body: isLoading                                     //「読み込み中」だったら「グルグル」が表示される
          ? const Center(
              child: CircularProgressIndicator(),         // これが「グルグル」の処理
            )
          : Column(
              children :[
                Container(                      // アイコンを表示
                  width: 80,height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,     // 丸にする
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/icon/dora.png')
                    )
                  )
                ),
                SizedBox(
                  child: Column(                                      // 縦並びで項目を表示
                    crossAxisAlignment: CrossAxisAlignment.stretch,   // 子要素の高さを合わせる
                    children: [
                      Container(                                      // 「名前」の見出し行の設定
                        child: const Text('名前'),
                        color: Colors.grey[300],
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      Container(                                      // catsテーブルのnameの表示を設定
                        padding: const EdgeInsets.all(5.0),
                        child: Text(cats.name),
                      ),
                      Container(                                      // 「性別」の見出し行の設定
                        child: const Text('性別'),
                        color: Colors.grey[300],
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      Container(                                      // catsテーブルのgenderの表示を設定
                        padding: const EdgeInsets.all(5.0),
                        child: Text(cats.gender),
                      ),
                      Container(                                      // 「誕生日」の見出し行の設定
                        child: const Text('誕生日'),
                        color: Colors.grey[300],
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      Container(                                      // catsテーブルのbirthdayの表示を設定
                        padding: const EdgeInsets.all(5.0),
                        child: Text(cats.birthday),
                      ),
                      Container(                                      // 「メモ」の見出し行の設定
                        child: const Text('メモ'),
                        color: Colors.grey[300],
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      Container(                                      // catsテーブルのmemoの表示を設定
                        padding: const EdgeInsets.all(5.0),
                        child: Text(cats.memo),
                      ),
                    ],
                  ),
                ),
              ],
          )
    
    );
  }
}
