import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/note.dart';

class HiveDataBase {
  final myBox = Hive.box("Notes");

  void addBox(RxList<Note> list) {
    myBox.add(Note(id: list[0].id, data: list[0].data));
  }
}
