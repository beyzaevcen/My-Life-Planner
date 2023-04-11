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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 36,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 36,
                    ))
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
            color: CColors.mainColor,
          )),
          const SizedBox(
            height: 20,
          ),
          //Action Buttons
          Row(
            children: const [],
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
