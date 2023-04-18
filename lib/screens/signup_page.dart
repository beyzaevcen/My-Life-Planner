import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/signup_controller.dart';

import '../utils/theme.dart';
import '../widgets/datetime_picker.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 30, color: CColors.black.withOpacity(0.6), fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.name,
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
                hintText: "Full name",
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const DateTimeWidget(text: "Date of Birth"),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.mail,
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
                hintText: "Email",
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Obx(() => TextFormField(
                  obscureText: controller.passwordShow.value,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: controller.password,
                  decoration: InputDecoration(
                    suffixIcon: Obx(() => IconButton(
                          onPressed: () {
                            if (controller.passwordShow.value == false) {
                              controller.passwordShow.value = true;
                            } else {
                              controller.passwordShow.value = false;
                            }
                          },
                          icon: controller.passwordShow.value
                              ? Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: CColors.black.withOpacity(0.5),
                                )
                              : Icon(
                                  FontAwesomeIcons.eye,
                                  color: CColors.black.withOpacity(0.5),
                                ),
                        )),
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
                    hintText: "Password",
                  ),
                )),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Obx(() => TextFormField(
                  obscureText: controller.passwordShowtwo.value,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: controller.confirmPassword,
                  decoration: InputDecoration(
                    suffixIcon: Obx(() => IconButton(
                          onPressed: () {
                            if (controller.passwordShowtwo.value == false) {
                              controller.passwordShowtwo.value = true;
                            } else {
                              controller.passwordShowtwo.value = false;
                            }
                          },
                          icon: controller.passwordShowtwo.value
                              ? Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: CColors.black.withOpacity(0.5),
                                )
                              : Icon(
                                  FontAwesomeIcons.eye,
                                  color: CColors.black.withOpacity(0.5),
                                ),
                        )),
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
                    hintText: "Confirm Password",
                  ),
                )),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.gender,
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
                hintText: "Gender",
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CColors.mainColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  onPressed: () {
                    controller.signUp();
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
