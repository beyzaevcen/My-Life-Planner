import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/home_controller.dart';

import '../data/hive_database.dart';
import '../utils/theme.dart';

class DeleteNote extends StatelessWidget {
  final String id;
  const DeleteNote({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return AlertDialog(
      title: const Center(
          child: Text(
        "Are you sure you want to delete this note?",
        textAlign: TextAlign.center,
      )),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: CColors.black.withOpacity(0.6)),
              ),
            ),
            TextButton(
                onPressed: () {
                  final idx = controller.notes.indexWhere((element) => element.id == id);
                  if (idx != -1) {
                    HiveDataBase.deleteBox(id);

                    controller.notes.removeAt(idx);
                  }
                  Get.back();
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ],
    );
  }
}
