import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/todo_contoller.dart';

import '../utils/theme.dart';

class ToDoWidget extends GetView<ToDoController> {
  const ToDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.todoList
          .map(
            (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  tileColor: e.isCompleted ? Colors.deepPurple : null,
                  leading: e.isCompleted
                      ? const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.deepPurple,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.deepPurple,
                        ),
                  onTap: () {
                    controller.updateTodo(e);
                  },
                  title: Text(
                    e.text,
                    style: TextStyle(
                        color: e.isCompleted ? Colors.white : Colors.black,
                        decoration:
                            e.isCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: e.isCompleted ? CColors.white : Colors.deepPurple,
                    ),
                    onPressed: () {},
                  ),
                )),
          )
          .toList(),
    );
  }
}
