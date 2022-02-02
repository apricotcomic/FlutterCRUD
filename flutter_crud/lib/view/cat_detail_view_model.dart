import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';

class CatDetailViewModel {

  //CatDetailViewModel(cats) {
  //  _cats = cats ?? initCat();
  //  _isNew = (cats == null);
  //  notifyListeners();
  //}

  late Cats _cats;
  Cats get cats => _cats;

  Cats? initCat() {
    return Cats(
        id: 0,
        name: '',
        birthday: '',
        gender: '',
        memo: '',
        createdAt: DateTime.now());
  }

  void setName(String name) {
    _cats.name = name;
  }

  void setBirthday(String birthday) {
    _cats.birthday = birthday;
  }

  void setGender(String gender) {
    _cats.gender = gender;
  }

  void setMemo(String memo) {
    _cats.memo = memo;
  }
}
