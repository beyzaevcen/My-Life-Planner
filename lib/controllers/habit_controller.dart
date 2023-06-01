import 'package:get/get.dart';
import 'package:notes_app/models/habit.dart';

class HabitController extends GetxController {
  final HabitList = <Habit>[Habit(12, 60, true, "Meditate"), Habit(3, 12, false, "Study")].obs;

  void habitS(int index) {
    HabitList[index].habitStarted = !HabitList[index].habitStarted;
    HabitList.refresh();
  }

  void settingsOpen(int index) {}
}
