import 'package:flutter_crud/model/db_helper.dart';
import 'package:intl/intl.dart';

class Cats {
  int? id;
  String name;
  String gender;
  String birthday;
  String memo;
  DateTime createdAt;

  Cats({
    this.id,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.memo,
    required this.createdAt,
  });

  Cats copy({
    int? id,
    String? name,
    String? birthday,
    String? gender,
    String? memo,
    DateTime? createdAt,
  }) =>
      Cats(
        id: id ?? this.id,
        name: name ?? this.name,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
        memo: memo ?? this.memo,
        createdAt: createdAt ?? this.createdAt,
      );

  static Cats fromJson(Map<String, Object?> json) => Cats(
        id: json[columnId] as int,
        name: json[columnName] as String,
        gender: json[columnGender] as String,
        birthday: json[columnBirthday] as String,
        memo: json[columnMemo] as String,
        createdAt: DateTime.parse(json[columnCreatedAt] as String),
      );

  Map<String, Object> toJson() => {
        columnName: name,
        columnGender: gender,
        columnBirthday: birthday,
        columnMemo: memo,
        columnCreatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt),
      };
}
