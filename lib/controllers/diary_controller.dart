import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  final dropDownValue = "2023".obs;

  final isFrontView = true.obs;
  final isContain = false.obs;

  final initialPage = 0.obs;

  final pageController = PageController(viewportFraction: 0.9);

  void switchView() {
    isFrontView.toggle();
  }

  checkIsContain() {}

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
