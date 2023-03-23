import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/note.dart';

class HiveDataBase {
  static final myBox = Hive.box("Notes");

  static void addBox(Note note) {
    myBox.put(note.id, note.toJson());
  }

  static void deleteBox(String id) {
    myBox.delete(id);
  }
}
