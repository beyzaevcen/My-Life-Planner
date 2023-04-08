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
        padding: const EdgeInsets.only(top: 30, left: 8.0, right: 8.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "My ToDo's",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const ToDoWidget(),
            Obx(
              () => controller.isTapped.value
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.task,
                        decoration: InputDecoration(
                          fillColor: CColors.backgroundcolor,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: CColors.mainColor, width: 2)),
                          enabledBorder:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: "Add Task",
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: controller.isTapped.toggle,
                            icon: const Icon(Icons.add),
                            color: CColors.mainColor),
                        const Text("Add Task")
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
