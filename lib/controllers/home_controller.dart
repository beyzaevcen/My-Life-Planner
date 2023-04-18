import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note.dart';

import '../data/hive_database.dart';
import '../services.dart/notes_api.dart';
import '../widgets/delete_todo.dart';

class HomeController extends GetxController {
  final notes = <Note>[].obs;

  @override
  void onInit() {
    for (final value in Hive.box("notes").values) {
      final note = Note.fromJson(value);
      notes.add(note);
    }
    notes.add(Note(id: "0"));

    super.onInit();
  }

  void deleteNote(String id) {
    final idx = notes.indexWhere((element) => element.id == id);
    if (idx != -1) {
      HiveDataBase.deleteBox(id);

      notes.removeAt(idx);
    }
    DeleteToDo.open(
        "Are you sure you want to delete this spectaculars note?", () => NotesApi.deleteNote(id));
  }
}
