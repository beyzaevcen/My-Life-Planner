import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/habit_controller.dart';

import '../utils/theme.dart';

class AddHabit extends GetView<HabitController> {
  const AddHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Add habit to make your life more productive",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter habit name';
                  }
                  return null;
                },
                controller: controller.habitName,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: CColors.mainColor, width: 2)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: CColors.white,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter a habit name",
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter time goal (min)';
                  }
                  return null;
                },
                controller: controller.timeGoal,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: CColors.mainColor, width: 2)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: CColors.white,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter a time goal(min)",
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CColors.main2Color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
              onPressed: () {
                controller.createHbait();
              },
              child: const Text(
                "Create a habit",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
