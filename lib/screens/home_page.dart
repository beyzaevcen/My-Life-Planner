import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_data.dart';
import 'package:provider/provider.dart';

import '../utils/theme.dart';
import 'editing_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getNotes().length;
    Note newNote = Note(id: id, text: "fms");
    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNew) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditingNotePage(
                  isNewNote: false,
                  note: note,
                )));
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.secondarySystemBackground,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: CColors.mainColor,
          onPressed: () => createNewNote(),
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 75.0, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "My Notes ♡",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              CupertinoListSection.insetGrouped(
                children:
                    NoteData().allNotes.map((e) => CupertinoListTile(title: Text(e.text))).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
