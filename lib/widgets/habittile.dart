import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/habit_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/theme.dart';

class HabitTile extends GetView<HabitController> {
  final String habitTile;
  final VoidCallback onTap;
  final VoidCallback settingsTap;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile(
      {super.key,
      required this.habitTile,
      required this.onTap,
      required this.settingsTap,
      required this.timeSpent,
      required this.timeGoal,
      required this.habitStarted});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Container(
            width: Get.width,
            height: 90,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: CColors.mainColor),
                borderRadius: BorderRadius.circular(12),
                color: CColors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //progress circle
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Stack(children: [
                            CircularPercentIndicator(
                              radius: 30,
                              percent: 0.7,
                              progressColor: const Color.fromARGB(255, 234, 154, 192),
                            ),
                            Center(
                                child: IconButton(
                                    onPressed: onTap,
                                    icon: habitStarted
                                        ? const Icon(Icons.pause)
                                        : const Icon(Icons.play_arrow_rounded)))
                          ]),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            habitTile,
                            style: const TextStyle(
                                color: CColors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$timeSpent/$timeGoal",
                            style: const TextStyle(color: CColors.darkSubtitle, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      settingsTap;
                    },
                    icon: const Icon(Icons.settings))
              ],
            )));
  }
}
