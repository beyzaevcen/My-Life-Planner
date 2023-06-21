import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/diary.dart';

import '../services.dart/diary_api.dart';

class DiaryController extends GetxController {
  late StreamSubscription<List<Diary>> getDiaries;
  final diaries = <Diary>[].obs;
  final diaryContain = <Diary>[].obs;

  final dropDownValue = "2023".obs;

  final isFrontView = true.obs;
  final isContain = false.obs;

  final initialPage = 0.obs;

  final pageController = PageController(viewportFraction: 0.8);

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

  void switchView() {
    isFrontView.toggle();
  }

  String makeFormat(int day, int month) {
    return "2023-$month-$day";
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
