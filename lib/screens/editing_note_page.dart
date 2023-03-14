import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/note_controller.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/theme.dart';

class EditingNotePage extends StatelessWidget {
  final Note? note;
  final bool isNewNote;
  const EditingNotePage({super.key, this.note, required this.isNewNote});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CColors.mainColor,
        leading: IconButton(
            onPressed: () {
              if (controller.quillController.value.document.isEmpty()) {
                Get.back();
              } else {
                String text = controller.quillController.value.document.toPlainText();

                controller.addNote(Note(id: controller.allNotes.length + 2, text: text));

                Get.back();
              }
            },
            icon: const Icon(Icons.navigate_before_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            QuillToolbar.basic(
              controller: controller.quillController.value,
              iconTheme:
                  const QuillIconTheme(iconSelectedFillColor: CColors.mainColor, borderRadius: 12),
            ),
            const SizedBox(
              height: 16,
            ),
            QuillEditor.basic(
              controller: controller.quillController.value,
              readOnly: false,
            )
          ],
        ),
      ),
    );
  }
}
