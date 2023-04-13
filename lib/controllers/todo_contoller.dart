import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/todo.dart';

class ToDoController extends GetxController {
  final todoList = <ToDo>[].obs;
  final task = TextEditingController();
  final taskText = "".obs;
  final isTapped = false.obs;
  final isCompleted = "".obs;

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
        text: task.text,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        isCompleted: false);

    todoList.add(todo);
    task.clear();
  }

  void updateTodo(ToDo toDo) {
    toDo.copyWith(isCompleted: toDo.isCompleted);
    print(toDo.isCompleted);
  }

  void deleteToDo(ToDo toDo) {
    todoList.remove(toDo);
  }
}
