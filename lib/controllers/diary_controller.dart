import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/diary.dart';

import '../services.dart/diary_api.dart';

class DiaryController extends GetxController {
  late StreamSubscription<List<Diary>> getDiaries;
  final diaries = <Diary>[].obs;
  @override
  void onInit() {
    getDiaries = DiaryApi.getDiaries().listen((event) {
      try {
        final diary = event.first;
        event.remove(diary);
        event.insert(0, diary);
      } catch (_) {}
      diaries.value = event;
    });
    super.onInit();
  }

  final dropDownValue = "2023".obs;

  final isFrontView = true.obs;
  final isContain = false.obs;

  final initialPage = 0.obs;

  final pageController = PageController(viewportFraction: 0.8);

  void switchView() {
    isFrontView.toggle();
  }

  bool checkIsContain(String date) {
    final d = date.substring(4);

    final value = diaries.map((e) => e.whenCreated.substring(4) == d);
    return false;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
