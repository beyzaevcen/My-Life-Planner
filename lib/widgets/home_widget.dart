import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/diary_page.dart';
import '../screens/notes_page.dart';
import '../screens/todo_page.dart';
import '../utils/theme.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 70, left: 8.0, right: 8.0),
        child: Column(children: [
          const Text(
            "ꕤ",
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 8,
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
            height: 8,
          ),
          Flexible(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                InkWell(
                  onTap: () => Get.to(const NotesPage()),
                  child: Container(
                      decoration: BoxDecoration(
                          color: CColors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.mainColor.withOpacity(0.7), width: 2),
                          boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 2.0)]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            FontAwesomeIcons.noteSticky,
                            size: 50,
                            color: CColors.black.withOpacity(0.6),
                          ),
                          Text(
                            "Notes",
                            style: GoogleFonts.comfortaa(
                                fontSize: 28, color: Colors.black.withOpacity(0.6)),
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: () => Get.to(const ToDoPage()),
                  child: Container(
                      decoration: BoxDecoration(
                          color: CColors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.mainColor.withOpacity(0.7), width: 2),
                          boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 3.0)]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            FontAwesomeIcons.list,
                            size: 50,
                            color: CColors.black.withOpacity(0.6),
                          ),
                          Text(
                            "ToDo",
                            style: GoogleFonts.comfortaa(
                                fontSize: 28, color: Colors.black.withOpacity(0.6)),
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: () => Get.to(const DiaryPage()),
                  child: Container(
                      decoration: BoxDecoration(
                          color: CColors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.mainColor.withOpacity(0.7), width: 2),
                          boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 3.0)]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            FontAwesomeIcons.book,
                            size: 50,
                            color: CColors.black.withOpacity(0.6),
                          ),
                          Text(
                            "Diary",
                            style: GoogleFonts.comfortaa(
                                fontSize: 28, color: Colors.black.withOpacity(0.6)),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ]));
  }
}
