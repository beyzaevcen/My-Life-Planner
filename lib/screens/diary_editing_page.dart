import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/diary_edit_controller.dart';

import '../utils/theme.dart';

class DiaryEditingPage extends StatelessWidget {
  int day;
  int year;
  String month;

  DiaryEditingPage({
    Key? key,
    required this.day,
    required this.year,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DiaryEditController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Row(
                    children: [
                      Text(
                        "$day ",
                        style: const TextStyle(color: CColors.black, fontSize: 20),
                      ),
                      Text(
                        "$month ",
                        style: const TextStyle(color: CColors.black, fontSize: 20),
                      ),
                      Text(
                        year.toString(),
                        style: const TextStyle(color: CColors.black, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: 30,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: controller.diary,
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
                  hintText: "How was your day today?",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
