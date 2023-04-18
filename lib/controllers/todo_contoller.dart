import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/services.dart/todo_api.dart';

import '../models/todo.dart';

class ToDoController extends GetxController {
  final todoList = <ToDo>[].obs;
  final task = TextEditingController();
  final isTapped = false.obs;

  late StreamSubscription<List<ToDo>> getTodosHandle;

  @override
  void onInit() {
    getTodosHandle = ToDoApi.getTodos().listen((event) {
      todoList.value = event;
    });

    todoList.add(ToDo(
        whenCreated: DateTime.now().millisecondsSinceEpoch.toString(),
        text: "text",
        id: "id",
        isCompleted: false));

    super.onInit();
  }

  @override
  void onClose() {
    getTodosHandle.cancel();
    super.onClose();
  }

  void addTodo() async {
    final todo = ToDo(
      whenCreated: DateTime.now().millisecondsSinceEpoch.toString(),
      text: task.text,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      isCompleted: false,
    );

    await ToDoApi.createTodo(todo);

    task.clear();
  }

  void updateTodo(ToDo toDo) async {
    final newToDo = toDo.copyWith(isCompleted: !toDo.isCompleted);
    await ToDoApi.updateTodo(newToDo);
  }

  void deleteToDo(String id) {
    ToDoApi.deleteToDo(id);
  }

  void complatedTask(ToDo e) {
    final todo = e.copyWith(isCompleted: true);
    final i = todoList.indexWhere((e) => e.whenCreated == todo.whenCreated);
    if (i != -1) {
      todoList[i] = todo;
    }
  }
}
