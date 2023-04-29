import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/calendar_page.dart';
import 'package:notes_app/widgets/constantss.dart';

import '../utils/theme.dart';

class BackView extends StatelessWidget {
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
                          crossAxisCount: 7,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0),
                      itemBuilder: (_, i) {
                        int day = i + 1;
                        return GestureDetector(
                          child: Text(day.toString()),
                          onTap: () => Get.to(const CalendarPage()),
                        );
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
