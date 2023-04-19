import 'dart:async';

import 'package:get/get.dart';
import 'package:notes_app/models/note.dart';

import '../services.dart/notes_api.dart';
import '../widgets/delete_todo.dart';

class HomeController extends GetxController {
  final notes = <Note>[].obs;
  late StreamSubscription<List<Note>> getTodosHandle;

  @override
  void onInit() {
    getTodosHandle = NotesApi.getNotes().listen((event) {
      notes.value = event;
    });
    super.onInit();
  }

  @override
  void onClose() {
    getTodosHandle.cancel();
    super.onClose();
  }

  void deleteNote(String id) {
    DeleteToDo.open(
        "Are you sure you want to delete this spectaculars note?", () => NotesApi.deleteNote(id));
  }
}
