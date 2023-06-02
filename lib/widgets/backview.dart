import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/diary_controller.dart';
import 'package:notes_app/screens/diary_editing_page.dart';
import 'package:notes_app/screens/extentions.dart';
import 'package:notes_app/services.dart/diary_api.dart';
import 'package:notes_app/widgets/constantss.dart';

import '../utils/theme.dart';

class BackView extends GetView<DiaryController> {
  final int monthIndex;
  const BackView({super.key, required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            color: CColors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8.0)]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                monthIndex.toString(),
                textScaleFactor: 2.0,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                months[monthIndex]!.keys.toList()[0],
                textScaleFactor: 2.5,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5.0),
              Expanded(
                  child: GridView.builder(
                      itemCount: months[monthIndex]!.values.toList()[0],
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 4.0),
                      itemBuilder: (_, i) {
                        int day = i + 1;
                        return GestureDetector(
                            onTap: () async {
                              final date = DateTime(2023, monthIndex, day);
                              EasyLoading.show(maskType: EasyLoadingMaskType.clear);
                              final res = await DiaryApi.getDiary(date.toDate);

                              if (res == null) {
                                Get.to(DiaryEditingPage(date: date));
                              } else {
                                Get.to(DiaryEditingPage(date: date, diary: res));
                              }
                              EasyLoading.dismiss(); //
                            },
                            child: controller.isContain.value
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: CColors.pink,
                                        border: Border.all(width: 1),
                                        borderRadius: const BorderRadius.all(Radius.circular(12))),
                                    child: Center(
                                      child: Text(
                                        day.toString(),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Center(
                                      child: Text(
                                        day.toString(),
                                      ),
                                    ),
                                  ));
                      })),
              const Text(
                "Selected a date to write",
                textScaleFactor: 0.8,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
