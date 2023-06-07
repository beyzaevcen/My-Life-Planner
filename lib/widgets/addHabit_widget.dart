import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/habit_controller.dart';

import '../utils/theme.dart';

class AddHabit extends GetView<HabitController> {
  int time
  const AddHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Column(
          children: const [
            TextField(
              decoration: InputDecoration(fillColor: CColors.main2Color),
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.add))
      ],
    );
  }
}
