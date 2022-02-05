import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CatDetailForm extends StatelessWidget {
  final String? name;
  final String? birthday;
  final String? gender;
  final String? memo;
  final DateTime? createdAt;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedBirthday;
  final ValueChanged<String> onChangedGender;
  final ValueChanged<String> onChangedMemo;

  const CatDetailForm({
    Key? key,
    this.name,
    this.birthday,
    this.gender,
    this.memo,
    this.createdAt,
    required this.onChangedName,
    required this.onChangedBirthday,
    required this.onChangedGender,
    required this.onChangedMemo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          changeName(),
          changeBirthday(),
          changeGender(),
          changeMemo(),
        ],
      ),
    );
  }

  Widget changeName() {
    return TextFormField(
          maxLines: 1,
          initialValue: name,
          decoration: const InputDecoration(
            hintText: '名前を入力してください',
          ),
          validator: (name) =>
              name != null && name.isEmpty ? '名前は必ず入れてね' : null,
          onChanged: onChangedName,
    );
  }

  Widget changeBirthday() {
    return TextFormField(
          maxLines: 1,
          initialValue: birthday,
          decoration: const InputDecoration(
            hintText: '誕生日を入力してください',
          ),
          onChanged: onChangedBirthday,
    );
  }

  Widget changeGender() {
    return TextFormField(
        maxLines: 1,
        initialValue: gender,
        decoration: const InputDecoration(
          hintText: '性別を入力してください',
        ),
        onChanged: onChangedGender,
      );
  }

  Widget changeMemo() {
    return TextFormField(
        maxLines: 1,
        initialValue: memo,
        decoration: const InputDecoration(
          hintText: 'メモを入力してください',
        ),
        onChanged: onChangedMemo,
      );
  }
}
