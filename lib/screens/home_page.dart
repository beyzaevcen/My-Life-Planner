import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notes_app/controllers/bottomnavigation_controller.dart';
import 'package:notes_app/utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    return Scaffold(
      bottomNavigationBar: Container(
        color: CColors.mainColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
          child: GNav(
            gap: 8,
            backgroundColor: CColors.mainColor,
            color: CColors.white,
            activeColor: CColors.white,
            tabBackgroundColor: CColors.mainColor,
            tabActiveBorder: Border.all(width: 1, color: CColors.white),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.person, text: "Profile"),
            ],
            onTabChange: (value) {
              controller.currentindex.value = value;
            },
          ),
        ),
      ),
      backgroundColor: CColors.backgroundcolor,
      body: Obx(() => controller.pages[controller.currentindex.value]),
    );
  }
}
