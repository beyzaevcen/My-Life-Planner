import '../models/note.dart';

class NoteController {
  List<Note> allNotes = [Note(id: 0, text: "Love yourself more"), Note(id: 1, text: "Drink water")];

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
}
