import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/todo.dart';

class ToDoController extends GetxController {
  final List<ToDo> todoList = [];
  final task = TextEditingController();
  final taskText = "".obs;
  final isTapped = false.obs;
  @override
  void onInit() {
    todoList.add(ToDo(
        whenCreated: DateTime.now().millisecondsSinceEpoch.toString(),
        text: "text",
        id: "id",
        isCompleted: false));

    super.onInit();
  }

  void addTodo() {
    final todo = ToDo(
        whenCreated: DateTime.now().millisecondsSinceEpoch.toString(),
        text: task.toString(),
        id: "",
        isCompleted: false);

    todoList.add(todo);
  }
}
