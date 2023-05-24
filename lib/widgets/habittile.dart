import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/theme.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Container(
            width: Get.width,
            height: 90,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: CColors.mainColor),
                borderRadius: BorderRadius.circular(12),
                color: CColors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //progress circle
                CircularPercentIndicator(
                  radius: 30,
                  percent: 0.7,
                  progressColor: CColors.main2Color,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Study",
                      style: TextStyle(
                          color: CColors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "2:00 / 10 =%20",
                      style: TextStyle(color: CColors.darkSubtitle, fontSize: 15),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
              ],
            )));
  }
}
