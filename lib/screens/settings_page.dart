import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/auth_controller.dart';

import '../utils/theme.dart';

class SettingsPage extends GetView<AuthController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CColors.backgroundcolor,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Icon(
                  FontAwesomeIcons.userNinja,
                  color: CColors.mainColor,
                  size: 70,
                )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Beyza Evcen",
                  style: TextStyle(color: CColors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                              side: const BorderSide(width: 1, color: CColors.main2Color)),
                        ),
                        onPressed: () {
                          controller.signOut();
                        },
                        child: const Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 20, color: CColors.black),
                        ),
                      ),
                    )),
              ]),
        ));
  }
}
