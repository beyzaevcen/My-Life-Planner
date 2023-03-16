import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/screens/editing_note_page.dart';

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
            Obx(
              () => CupertinoListSection.insetGrouped(
                  children: Const.allNotes
                      .map((e) => CupertinoListTile(
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: CColors.darkSubtitle,
                              ),
                              onPressed: () {
                                final idx =
                                    Const.allNotes.indexWhere((element) => element.id == e.id);
                                if (idx != -1) {
                                  Const.allNotes.removeAt(idx);
                                }
                              },
                            ),
                            title: Text(
                                "${e.document.toPlainText().substring(0, min(e.document.toPlainText().length, 50))}..."),
                            onTap: () {
                              // controller.quillController.value.document.toPlainText() = e.text;

                              Get.to(EditingNotePage(note: e));
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
