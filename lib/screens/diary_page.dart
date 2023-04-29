import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/diary_controller.dart';
import 'package:notes_app/widgets/backview.dart';
import 'package:notes_app/widgets/frontview.dart';

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
                  child: Obx(() => PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.initialPage,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.itemCount.value,
                      itemBuilder: (_, index) => controller.isFrontView.value
                          ? FrontView(monthIndex: index + 1)
                          : BackView(monthIndex: index + 1))))),
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
                  Obx(() => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle, color: CColors.mainColor),
                          child: IconButton(
                              onPressed: () {
                                controller.switchView();
                              },
                              icon: controller.isFrontView.value
                                  ? const Icon(
                                      Icons.calendar_month,
                                      color: CColors.white,
                                    )
                                  : const Icon(
                                      Icons.undo_rounded,
                                      color: CColors.white,
                                    )),
                        ),
                      ))
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
