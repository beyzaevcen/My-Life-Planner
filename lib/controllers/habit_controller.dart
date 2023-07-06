import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/habit.dart';
import 'package:notes_app/services.dart/habit_api.dart';
import 'package:notes_app/widgets/addhabit_widget.dart';

class HabitController extends GetxController {
  final HabitList =
      <Habit>[Habit(12, 60, false, "Meditate", "0"), Habit(0, 12, false, "Study", "1")].obs;

  late StreamSubscription<List<Habit>> getHabits;

  final habitName = TextEditingController();
  final timeGoal = TextEditingController();

  Timer? timer;

  @override
  void onInit() {
    getHabits = HabitApi.getHabits().listen((event) {
      HabitList.value = event;
    });
    super.onInit();
  }

  void habitS(int index) {
    //habit strated or stopped
    HabitList[index].habitStarted = !HabitList[index].habitStarted;

    if (HabitList[index].habitStarted == true) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        HabitList[index].timeSpent++;
      });
    }

    HabitList.refresh();
  }

  String formatToMinSecond(int totalSeconds) {
    String secs = (totalSeconds % 60).toString();
    String mins = (totalSeconds / 60).toStringAsFixed(5);

    if (secs.length == 1) {
      secs = "0$secs";
    }

    if (mins[1] == ".") {
      mins = mins.substring(0, 1);
    }

    return "$mins:$secs";
  }

  double percentCompleted(int timeSpent, int timeGoal) {
    return timeSpent / (timeGoal * 60);
  }

  void addHabit() {
    Get.dialog(const AddHabit());
  }

  void createHbait() {
    String id = DateTime.now().toString();
    HabitList.add(Habit(0, int.parse(timeGoal.text), false, habitName.text, id));
    HabitApi.createHabit(Habit(0, int.parse(timeGoal.text), false, habitName.text, id));
    habitName.clear();
    timeGoal.clear();
    Get.back();
  }

  @override
  void onClose() {
    getHabits.cancel();
    super.onClose();
  }
}
// canım edam biricik edam, bi seni bi de ezeli ayrı severim

