import 'package:flutter/material.dart';
import 'package:flutter_crud/view/cat_detail.dart';
import 'package:flutter_crud/view/cat_detail_edit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_crud/main.dart';

void main() {
  testWidgets('猫一覧テスト', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('猫一覧'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    // 追加ボタンをタップ
    await tester.tap(find.byIcon(Icons.add));
    // 描画フレームがなくなるまでpump
    await tester.pumpAndSettle();
    // 猫編集画面が開くこと
    expect(find.text('猫編集'), findsOneWidget);
    // 項目セット
    await tester.enterText(find.byType(TextFormField).at(0), 'どら');
    await tester.tap(find.byKey(const ValueKey('gender')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('女の子').last);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(1), '2001/7/1');
    await tester.enterText(find.byType(TextFormField).at(2), 'どらのメモ');
    // 更新ボタンをタップ
    await tester.tap(find.text('保存'));
    await tester.pumpAndSettle();
    expect(find.text('どら'), findsOneWidget);
    expect(find.text('2001/7/1'), findsOneWidget);
    expect(find.text('どらのメモ'), findsOneWidget);
  });

  //testWidgets('猫詳細テスト', (WidgetTester tester) async {
  //  await tester.pumpWidget(const MaterialApp(
  //      home: CatDetail(
  //    id: 0,
  //  )));
  //  expect(find.text('猫詳細'), findsOneWidget);
  //});

  //testWidgets('猫編集テスト', (WidgetTester tester) async {
  //  await tester.pumpWidget(const MaterialApp(home: CatDetailEdit()));
  //  expect(find.text('猫編集'), findsOneWidget);
  //});
}
