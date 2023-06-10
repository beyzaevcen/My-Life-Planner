import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/extentions.dart';

import '../services.dart/diary_api.dart';

class DiaryController extends GetxController {
  final dropDownValue = "2023".obs;

  final isFrontView = true.obs;
  final isContain = false.obs;

  final initialPage = 0.obs;

  final pageController = PageController(viewportFraction: 0.8);

  void switchView() {
    isFrontView.toggle();
  }

  Future<bool> checkIsContain(DateTime date) async {
    final res = await DiaryApi.getDiary(date.toDate);
    if (res == null) {
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
