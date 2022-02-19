import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'db_helper_mock.mocks.dart';

@GenerateMocks([DbHelper])
void main() {
  var dbhelper = MockDbHelper();

  test('catテーブルinsert', () async {
    when(dbhelper.insert(Cats(
            name: 'どら',
            gender: '女の子',
            birthday: '2001/5/1',
            memo: 'どらのメモ',
            createdAt: DateTime.now())))
        .thenAnswer((_) async => 'cat');
    expect(
        await dbhelper.insert(Cats(
            name: 'どら',
            gender: '女の子',
            birthday: '2001/5/1',
            memo: 'どらのメモ',
            createdAt: DateTime.now())),
        'cat');
  });
}
