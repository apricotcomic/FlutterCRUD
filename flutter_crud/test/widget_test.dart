import 'package:flutter/material.dart';
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
    // 保存ボタンをタップ
    await tester.tap(find.text('保存'));
    await tester.pumpAndSettle();
    
    // 一覧画面に戻る
    expect(find.text('猫一覧'), findsOneWidget);
  });
}
