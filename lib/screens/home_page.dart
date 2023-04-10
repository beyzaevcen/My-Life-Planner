import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/notes_page.dart';
import 'package:notes_app/screens/todo_page.dart';
import 'package:notes_app/utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentindex = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CColors.backgroundcolor,
        selectedItemColor: CColors.mainColor,
        currentIndex: currentindex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Profile"),
        ],
      ),
      backgroundColor: CColors.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 8.0, right: 8.0),
        child: Column(
          children: [
            const Text(
              "ꕤ",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "How do you feel today?",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
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
                          color: CColors.purple,
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.purple, width: 2),
                        ),
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
                              style: TextStyle(fontSize: 36, color: CColors.black.withOpacity(0.6)),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () => Get.to(const ToDoPage()),
                    child: Container(
                        decoration: BoxDecoration(
                          color: CColors.purple.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.purple.withOpacity(0.3), width: 2),
                        ),
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
                              style: TextStyle(fontSize: 36, color: CColors.black.withOpacity(0.6)),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          color: CColors.purple.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.purple.withOpacity(0.3), width: 2),
                        ),
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
                              style: TextStyle(fontSize: 36, color: CColors.black.withOpacity(0.6)),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          color: CColors.purple,
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: CColors.purple, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FontAwesomeIcons.film,
                              size: 50,
                              color: CColors.black.withOpacity(0.6),
                            ),
                            Text(
                              "Films",
                              style: TextStyle(fontSize: 36, color: CColors.black.withOpacity(0.6)),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
