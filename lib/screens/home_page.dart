import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/editing_note_page.dart';

import '../controllers/note_controller.dart';
import '../utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CColors.mainColor,
        onPressed: () {
          Get.to(const EditingNotePage());
        },
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
              children: NoteController()
                  .allNotes
                  .map((e) => CupertinoListTile(
                        title: Text(e.text),
                        onTap: () {
                          Get.to(const EditingNotePage());
                        },
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
