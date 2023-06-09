import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/controllers/todo_contoller.dart';
import 'package:notes_app/utils/theme.dart';
import 'package:notes_app/widgets/delete_todo.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ToDoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.backgroundcolor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CColors.black,
            )),
      ),
      backgroundColor: CColors.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "My ToDo's",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            /*
            StreamBuilder(
              stream: ToDoApi.getTodos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                final todos = snapshot.data!;
                return Column(children: todos.map((e) => Text(e.text)).toList());
              },
            ),
            */
            Obx(
              () => controller.todoList.isNotEmpty
                  ? Column(
                      children: controller.todoList
                          .map(
                            (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: ListTile(
                                  leading: e.isCompleted
                                      ? const Icon(
                                          Icons.circle,
                                          color: CColors.mainColor,
                                        )
                                      : const Icon(
                                          Icons.circle_outlined,
                                          color: CColors.mainColor,
                                        ),
                                  onTap: () {
                                    controller.updateTodo(e);
                                  },
                                  title: Text(
                                    e.text,
                                    style: TextStyle(
                                        decoration: e.isCompleted
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                    onPressed: () {
                                      DeleteToDo.open(
                                        "Are you sure you want to delete this spectaculars task?",
                                        () => controller.deleteToDo(e.id),
                                      );
                                    },
                                  ),
                                )),
                          )
                          .toList())
                  : Lottie.asset("assets/newScene.json"),
            ),
            Obx(
              () => controller.isTapped.value
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.task,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.addTodo();
                                controller.isTapped.value = false;
                              },
                              icon: const Icon(
                                Icons.add,
                                color: CColors.mainColor,
                              )),
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
