import 'package:flutter/material.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [Note(id: 0, text: "Love yourself more"), Note(id: 1, text: "Drink water")];

  List<Note> getNotes() {
    return allNotes;
  }

  void addNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (note.id == allNotes[i].id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
