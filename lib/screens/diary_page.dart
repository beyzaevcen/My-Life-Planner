import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/diary_controller.dart';

import '../utils/theme.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiaryController());

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 36,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 36,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() => DropdownButton<String>(
                value: controller.dropDownValue.value,
                items: const [
                  DropdownMenuItem(value: "2023", child: Text("2023")),
                  DropdownMenuItem(value: "2022", child: Text("2022")),
                ],
                onChanged: (newValue) {
                  controller.dropDownValue.value = newValue!;
                },
              )),
          const SizedBox(
            height: 20,
          ),
          //Month Cards
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: PageView(
              controller: PageController(
                initialPage: 0,
                viewportFraction: 0.75,
              ),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CColors.mainColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //month
                        const Text(
                          "12",
                          textScaleFactor: 3.5,
                          style: TextStyle(color: CColors.white),
                        ),
                        const Text(
                          "APR",
                          textScaleFactor: 2.5,
                          style: TextStyle(color: CColors.white),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                const Text(
                                  "selam",
                                  style: TextStyle(color: CColors.white),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 3.0,
                                  color: Colors.white30,
                                ),
                              ],
                            )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert_outlined,
                                  color: CColors.white,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          //Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: CColors.mainColor, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.sunny),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Today"),
                          Text("12/04/2002"),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration:
                          const BoxDecoration(shape: BoxShape.circle, color: CColors.mainColor),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: CColors.white,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration:
                          const BoxDecoration(shape: BoxShape.circle, color: CColors.mainColor),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.calendar_month,
                            color: CColors.white,
                          )),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
