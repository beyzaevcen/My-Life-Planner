import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/screens/habit_page.dart';

import '../screens/diary_page.dart';
import '../screens/notes_page.dart';
import '../screens/todo_page.dart';
import '../utils/theme.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
      child: ListView(
        children: [
          const Center(
            child: Text(
              "ꕤ",
              style: TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          InkWell(
            onTap: () {},
            child: Container(
                decoration: const BoxDecoration(
                  color: CColors.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "How do you feel today?",
                        style: TextStyle(fontSize: 28),
                      ),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.to(const NotesPage()),
                  child: Container(
                      width: Get.width,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: CColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          boxShadow: [BoxShadow(color: CColors.mainColor, blurRadius: 2.0)]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.noteSticky,
                              size: 50,
                              color: CColors.black.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Notes",
                              style: GoogleFonts.comfortaa(
                                  fontSize: 28, color: Colors.black.withOpacity(0.6)),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.to(const ToDoPage()),
                  child: Container(
                      width: Get.width,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: CColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          boxShadow: [BoxShadow(color: CColors.mainColor, blurRadius: 3.0)]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.list,
                              size: 50,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "ToDo",
                              style: GoogleFonts.comfortaa(
                                  fontSize: 28, color: Colors.black.withOpacity(0.6)),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.to(const DiaryPage()),
                  child: Container(
                      width: Get.width,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: CColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          boxShadow: [BoxShadow(color: CColors.mainColor, blurRadius: 3.0)]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.book,
                              size: 50,
                              color: CColors.black.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Diary",
                              style: GoogleFonts.comfortaa(
                                  fontSize: 28, color: Colors.black.withOpacity(0.6)),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.to(const HabittrickerPage()),
                  child: Container(
                      width: Get.width,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: CColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          boxShadow: [BoxShadow(color: CColors.mainColor, blurRadius: 3.0)]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                              size: 50,
                              color: CColors.black.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Habit Tracker",
                              style: GoogleFonts.comfortaa(
                                  fontSize: 28, color: Colors.black.withOpacity(0.6)),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
