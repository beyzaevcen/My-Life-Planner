import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/habit_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/theme.dart';

class HabitTile extends GetView<HabitController> {
  final String habitTile;
  final VoidCallback onTap;
  final VoidCallback deleteTap;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile(
      {super.key,
      required this.habitTile,
      required this.onTap,
      required this.deleteTap,
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
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12), color: CColors.main2Color),
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
                                percent: (controller.percentCompleted(timeSpent, timeGoal) * 100),
                                backgroundColor: CColors.white,
                                circularStrokeCap: CircularStrokeCap.round,
                                animation: true,
                                animationDuration: 1500,
                                progressColor: CColors.mainColor),
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
                            "${controller.formatToMinSecond(timeSpent)}/$timeGoal = %${(controller.percentCompleted(timeSpent, timeGoal) * 100).toStringAsFixed(0)}",
                            style: TextStyle(color: CColors.white.withOpacity(0.7), fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: deleteTap,
                    child: Icon(
                      Icons.delete,
                      color: CColors.white.withOpacity(0.5),
                    ),
                  ),
                )
              ],
            )));
  }
}
