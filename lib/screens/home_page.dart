import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/notes_page.dart';
import 'package:notes_app/screens/todo_page.dart';
import 'package:notes_app/utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "ꕤ",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(
                Icons.note_add_outlined,
                size: 42,
              ),
              visualDensity: const VisualDensity(vertical: 4),
              title: Text(
                "My Notes",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CColors.black.withOpacity(0.6)),
              ),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              onTap: () {
                Get.to(const NotesPage());
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(
                Icons.toc_outlined,
                size: 42,
              ),
              visualDensity: const VisualDensity(vertical: 4),
              title: Text(
                "To Do",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CColors.black.withOpacity(0.6)),
              ),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              onTap: () {
                Get.to(const ToDoPage());
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              leading: const Icon(
                Icons.book,
                size: 42,
              ),
              visualDensity: const VisualDensity(vertical: 4),
              title: Text(
                "Diary",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CColors.black.withOpacity(0.6)),
              ),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
