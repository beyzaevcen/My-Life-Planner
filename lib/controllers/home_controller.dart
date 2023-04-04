import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note.dart';

import '../widgets/delete_pasword.dart';

class HomeController extends GetxController {
  final notes = <Note>[].obs;

  @override
  void onInit() {
    for (final value in Hive.box("notes").values) {
      final note = Note.fromJson(value);
      notes.add(note);
    }
    notes.add(Note(id: "0"));

    super.onInit();
  }

  void deleteNote(String id) {
    Get.dialog(DeletePassword(
      id: id,
    ));
  }
}
