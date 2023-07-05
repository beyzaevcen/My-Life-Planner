import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/habit_controller.dart';
import 'package:notes_app/utils/theme.dart';
import 'package:notes_app/widgets/delete_habit.dart';
import 'package:notes_app/widgets/habittile.dart';

class HabittrickerPage extends StatelessWidget {
  const HabittrickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HabitController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CColors.mainColor,
          title: const Text(
            "Consistency is key.",
          ),
          centerTitle: false,
        ),
        backgroundColor: CColors.backgroundcolor,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: CColors.main2Color,
          onPressed: () {
            controller.addHabit();
          },
          child: const Icon(Icons.add),
        ),
        body: Obx(() => Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                  itemCount: controller.HabitList.length,
                  itemBuilder: ((context, index) {
                    return HabitTile(
                      habitTile: controller.HabitList[index].habitTile,
                      habitStarted: controller.HabitList[index].habitStarted,
                      onTap: () {
                        controller.habitS(index);
                      },
                      deleteTap: () {
                        Get.dialog(DeleteHabit(index: index, id: controller.HabitList[index].id));
                      },
                      timeGoal: controller.HabitList[index].timeGoal,
                      timeSpent: controller.HabitList[index].timeSpent,
                    );
                  })),
            )));
  }
}
