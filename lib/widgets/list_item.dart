import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

import '../utils/theme.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDeleted,
  });

  final Note note;
  final Function() onTap;
  final Function() onDeleted;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: CColors.darkSubtitle,
        ),
        onPressed: onDeleted,
      ),
      title: Text(
          "${note.document?.toPlainText().substring(0, min(note.document!.toPlainText().length, 50))}..."),
      onTap: onTap,
    );
  }
}
