import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/data/hive_database.dart';

import '../models/note.dart';

class NoteController extends GetxController {
  NoteController(this.note);

  final Note? note;

  late final QuillController quillController;

  @override
  void onInit() {
    quillController = QuillController(
      selection: const TextSelection.collapsed(offset: 0),
      document: note?.document ??
          Document.fromJson([
            {"insert": "\n"}
          ]),
    );

    super.onInit();
  }

  void addNote() {
    List<dynamic> data = quillController.document.toDelta().toJson();
    final key = DateTime.now().millisecondsSinceEpoch.toString();

    final note = Note(id: key, data: data);

    HiveDataBase.addBox(note);
    Get.find<HomeController>().notes.add(note);
  }

  void updateNote(String key) {
    final controller = Get.find<HomeController>();

    if (note == null) return;
    List<dynamic> data = quillController.document.toDelta().toJson();
    final idx = controller.notes.indexWhere((e) => e.id == note!.id);
    if (idx != -1) {
      controller.notes[idx] = note!.copyWith(data: data);
      HiveDataBase.addBox(note!);

      controller.notes.refresh();
    }
  }
}
