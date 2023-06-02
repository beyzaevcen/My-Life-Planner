import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/habit.dart';

class HabitController extends GetxController {
  final HabitList = <Habit>[Habit(0, 60, false, "Meditate"), Habit(0, 12, false, "Study")].obs;

  void habitS(int index) {
    //note what the start time is
    var startTime = DateTime.now();
    int elepsadTime = HabitList[index].timeSpent;
    print(startTime);

    //habit strated or stopped
    HabitList[index].habitStarted = !HabitList[index].habitStarted;

    //keep the time going

    if (HabitList[index].habitStarted) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        //check when the user  stopped the timer
        if (HabitList[index].habitStarted = false) {
          timer.cancel();
        }

        var currentTime = DateTime.now();
        HabitList[index].timeSpent = currentTime.second -
            startTime.second +
            60 * (currentTime.minute - startTime.minute) +
            60 * 60 * (currentTime.minute - startTime.minute);
      });
    }
    HabitList.refresh();
  }

  void settingsOpen(int index) {
    Get.dialog(AlertDialog(
      title: Text("Settings for ${HabitList[index].habitTile}"),
    ));
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
}
// canım edam biricik edam, bi seni bi de ezeli ayrı severim

