import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/todo_contoller.dart';
import 'package:notes_app/utils/theme.dart';

class DeleteToDo extends StatelessWidget {
  final String id;
  const DeleteToDo({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ToDoController());
    return AlertDialog(
      title: const Center(
          child: Text(
        "Are you sure you want to delete this task?",
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
                  final idx = controller.todoList.indexWhere((element) => element.id == id);
                  controller.todoList.removeAt(idx);

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
