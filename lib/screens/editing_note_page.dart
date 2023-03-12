import 'package:flutter/material.dart';

import '../models/note.dart';

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;

  EditingNotePage({
    Key? key,
    required this.note,
    required this.isNewNote,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
