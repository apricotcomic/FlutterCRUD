import 'package:flutter/material.dart';
import 'package:flutter_crud/view/cat_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catListNotifierProvider = ChangeNotifierProvider((_) {
  [];
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '猫一覧',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => const CatList(),    //cat_list.dartを呼び出し
      },
    );
  }
}

