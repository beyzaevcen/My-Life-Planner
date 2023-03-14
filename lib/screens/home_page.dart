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
    final controller = Get.put(NoteController());
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CColors.mainColor,
        onPressed: () {
          controller.createNewNote();
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
            Obx(
              () => CupertinoListSection.insetGrouped(
                  children: controller.allNotes
                      .map((e) => CupertinoListTile(
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: CColors.darkSubtitle,
                              ),
                              onPressed: () {
                                controller.deleteNote(e);
                              },
                            ),
                            title: Text(e.text),
                            onTap: () {
                              // controller.quillController.value.document.toPlainText();

                              Get.to(EditingNotePage(note: e, isNewNote: false));
                            },
                          ))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
