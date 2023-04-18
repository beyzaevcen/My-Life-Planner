import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/todo_contoller.dart';
import 'package:notes_app/utils/theme.dart';

class DeleteToDo extends GetView<ToDoController> {
  final String question;
  final Function() onDeleted;

  const DeleteToDo({
    super.key,
    required this.question,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        question,
        textAlign: TextAlign.center,
      )),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: Get.back,
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
                  onDeleted();
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

  static void open(String question, Function() onDeleted) => Get.dialog(DeleteToDo(
        question: question,
        onDeleted: onDeleted,
      ));
}
