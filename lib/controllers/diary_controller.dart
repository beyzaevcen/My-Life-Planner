import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  var dropDownValue = "2023".obs;
  var isFrontView = true.obs;
  var initialPage = 0.obs;
  var viewportFraction = 0.75.obs;
  var itemCount = 12.obs;
  var pageController = PageController(viewportFraction: 0.75);
  var isContain = false.obs;

  switchView() {
    isFrontView.value = !isFrontView.value;
  }

  checkIsContain() {}
}
