import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/diary.dart';
import 'package:notes_app/screens/extentions.dart';
import 'package:notes_app/services.dart/diary_api.dart';

class DiaryEditController extends GetxController {
  final diarym = TextEditingController();
  final diaryList = <Diary>[].obs;
  var isEmpty = true;

  Diary? tempDiary;
  DiaryEditController(this.tempDiary);

  @override
  void onInit() {
    diarym.text = tempDiary?.text ?? "";
    super.onInit();
  }

  void addDiary(DateTime date) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    final diary = Diary(
      text: diarym.text,
      whenCreated: tempDiary?.whenCreated ?? date.toDate,
      id: tempDiary?.id ?? date.millisecondsSinceEpoch.toString(),
    );

    print(diary);

    final status = await DiaryApi.createDiary(diary);
    EasyLoading.dismiss();
    if (status) {
      Get.back();
    } else {
      print("hata");
    }
    isEmpty = false;
  }

  String fixed(String num) {
    if (num.length == 1) {
      return "0$num";
    }
    return num;
  }
}
