import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:notes_app/const.dart';

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
    final note = Note(id: DateTime.now().millisecondsSinceEpoch, data: data);
    Const.allNotes.add(note);
  }

  void updateNote() {
    if (note == null) return;
    List<dynamic> data = quillController.document.toDelta().toJson();
    final idx = Const.allNotes.indexWhere((element) => element.id == note!.id);
    if (idx != -1) {
      Const.allNotes[idx] = note!.copyWith(data: data);
      Const.allNotes.refresh();
    }
  }

  void deleteNote(Note note) {
    if (note == null) return;
    final idx = Const.allNotes.indexWhere((element) => element.id == note.id);
    if (idx != -1) {
      Const.allNotes.removeAt(idx);
    }
  }
}
