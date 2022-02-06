import 'package:flutter/material.dart';
import 'package:flutter_crud/model/cats.dart';
import 'package:flutter_crud/model/db_helper.dart';
import 'package:flutter_crud/view/cat_detail_form.dart';

class CatDetailEdit extends StatefulWidget {
  final Cats? cats;

  const CatDetailEdit({Key? key, this.cats}) : super(key: key);

  @override
  _CatDetailEditState createState() => _CatDetailEditState();
}

class _CatDetailEditState extends State<CatDetailEdit> {
  final _formkey = GlobalKey<FormState>();
  late int id;
  late String name;
  late String birthday;
  late String gender;
  late String memo;
  late DateTime createdAt;

  @override
  void initState() {
    super.initState();
    id = widget.cats?.id ?? 0;
    name = widget.cats?.name ?? '';
    birthday = widget.cats?.birthday ?? '';
    gender = widget.cats?.gender ?? '';
    memo = widget.cats?.memo ?? '';
    createdAt = widget.cats?.createdAt ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('猫編集'),
        actions: [
          buildSaveButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: CatDetailForm(
            name: name,
            birthday: birthday,
            gender: gender,
            memo: memo,
            onChangedName: (name) => setState(() => this.name = name),
            onChangedBirthday: (birthday) =>
                setState(() => this.birthday = birthday),
            onChangedGender: (gender) => setState(() => this.gender = gender),
            onChangedMemo: (memo) => setState(() => this.memo = memo),
          ),
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    final isFormValid = name.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Text('保存'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? Colors.redAccent : Colors.grey.shade700,
        ),
        onPressed: createOrUpdateCat,
      ),
    );
  }

  void createOrUpdateCat() async {
    final isValid = _formkey.currentState!.validate();

    if (isValid) {
      final isUpdate = (widget.cats != null);

      if (isUpdate) {
        await updateCat();
      } else {
        await createCat();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateCat() async {
    final cat = widget.cats!.copy(
      name: name,
      birthday: birthday,
      gender: gender,
      memo: memo,
    );

    await DbHelper.instance.update(cat);
  }

  Future createCat() async {
    final cat = Cats(
      name: name,
      birthday: birthday,
      gender: gender,
      memo: memo,
      createdAt: createdAt,
    );
    await DbHelper.instance.insert(cat);
  }
}