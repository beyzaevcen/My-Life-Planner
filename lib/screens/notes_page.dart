import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/screens/editing_note_page.dart';
import 'package:notes_app/widgets/list_item.dart';

import '../utils/theme.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.backgroundcolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CColors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: CupertinoColors.secondarySystemBackground,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CColors.mainColor,
        onPressed: () {
          print(controller.notes.length);
          Get.to(const EditingNotePage());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "My Notes",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => controller.notes.isNotEmpty
                  ? CupertinoListSection.insetGrouped(
                      children: controller.notes
                          .map((e) => ListItem(
                                note: e,
                                onTap: () => Get.to(EditingNotePage(note: e)),
                                onDeleted: () => controller.deleteNote(e.id),
                              ))
                          .toList(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 200, left: 16, right: 16),
                      child: Lottie.asset("assets/newScene.json"),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
