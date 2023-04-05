import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/todo_contoller.dart';
import 'package:notes_app/utils/theme.dart';
import 'package:notes_app/widgets/todo.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ToDoController());
    return Scaffold(
      backgroundColor: CColors.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 8.0, right: 8.0),
        child: ListView(
          children: [
            const ToDoWidget(),
            Obx(
              () => controller.isTapped.value
                  ? const Text("Hello")
                  : IconButton(onPressed: controller.isTapped.toggle, icon: const Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
