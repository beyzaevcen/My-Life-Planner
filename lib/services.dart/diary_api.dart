import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/auth_controller.dart';
import '../models/diary.dart';
import 'helper.dart';

class DiaryApi {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> createDiary(Diary diary) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("diary")
          .doc(diary.whenCreated)
          .set(diary.toMap());

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }

  static Future<Diary?> getDiary(String date) async {
    try {
      final result = await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("diary")
          .doc(date)
          .get();

      return Diary.fromMap(result.data()!);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> deleteDiary(String id) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("diary")
          .doc(id)
          .delete();

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }
}
