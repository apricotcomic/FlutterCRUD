class Cats {
  int id;
  String name;
  String gender;
  String birthday;
  String memo;
  DateTime createdAt;

  Cats({
    required this.id,
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
        id: json['id'] as int,
        name: json['name'] as String,
        gender: json['gender'] as String,
        birthday: json['birthday'] as String,
        memo: json['memo'] as String,
        createdAt: DateTime.parse(json['createAt'] as String),
      );

  Map<String, Object> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'birthday': birthday,
        'memo': memo,
        'createdAt': createdAt,
      };
}
