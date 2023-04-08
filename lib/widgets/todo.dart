import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/todo_contoller.dart';

import '../utils/theme.dart';

class ToDoWidget extends GetView<ToDoController> {
  const ToDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(controller.todoList.map((e) => Text(e.text)).toString()),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          leading: const Icon(
            Icons.circle_outlined,
            color: CColors.mainColor,
          ),
        )
      ],
    );
  }
}
