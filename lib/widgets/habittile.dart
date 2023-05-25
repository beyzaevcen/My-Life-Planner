import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/theme.dart';

class HabitTile extends StatelessWidget {
  final String habitTile;
  const HabitTile({super.key, required this.habitTile});

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
                      SizedBox(
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
                                  onPressed: () {}, icon: const Icon(Icons.play_arrow_rounded)))
                        ]),
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
                          const Text(
                            "2:00 / 10 =%20",
                            style: TextStyle(color: CColors.darkSubtitle, fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
            )));
  }
}
