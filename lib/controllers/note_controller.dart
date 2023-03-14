import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/editing_note_page.dart';

import '../models/note.dart';

class NoteController extends GetxController {
  final allNotes =
      <Note>[Note(id: 0, text: "Love yourself more"), Note(id: 1, text: "Drink water")].obs;

  Rx<QuillController> quillController = QuillController.basic().obs;
  List<Note> getNotes() {
    return allNotes;
  }

  void addNote(Note note) {
    allNotes.add(note);
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (note.id == allNotes[i].id) {
        allNotes[i].text = text;
      }
    }
  }

  void deleteNote(Note note) {
    allNotes.remove(note);
  }

  void createNewNote() {
    int id = getNotes().length;

    Note newNote = Note(id: id, text: "");

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Get.to(EditingNotePage(note: note, isNewNote: isNewNote));
  }
}
