import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/habit_controller.dart';
import 'package:notes_app/services.dart/habit_api.dart';

import '../utils/theme.dart';

class DeleteHabit extends GetView<HabitController> {
  const DeleteHabit({super.key, required this.id, required this.index});
  final String id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        "Are you sure you want to delete this habit?",
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
                  controller.HabitList.remove(controller.HabitList[index]);
                  HabitApi.deleteHabit(id);
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
