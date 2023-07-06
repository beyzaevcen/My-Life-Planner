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
          padding: const EdgeInsets.only(top: 100.0, right: 30, left: 30),
          child: Column(children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  color: CColors.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  boxShadow: [BoxShadow(color: CColors.mainColor, blurRadius: 2.0)]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('assets/beyza.jpeg'),
                    radius: 45,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Beyza Evcen",
                    style: TextStyle(color: CColors.black, fontSize: 20),
                  ),
                ],
              ),
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
                        elevation: 0,
                        backgroundColor: CColors.backgroundcolor,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.user,
                            color: CColors.black.withOpacity(0.7),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Account",
                            style: TextStyle(fontSize: 20, color: CColors.black),
                          ),
                        ],
                      )),
                )),
            const Divider(height: 1),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: CColors.backgroundcolor,
                      ),
                      onPressed: () {
                        controller.signOut();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            color: CColors.black.withOpacity(0.7),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Sign Out",
                            style: TextStyle(fontSize: 20, color: CColors.black),
                          ),
                        ],
                      )),
                )),
            const Divider(height: 1),
            const SizedBox(
              height: 5,
            )
          ]),
        ));
  }
}
