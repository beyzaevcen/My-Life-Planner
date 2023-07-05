import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/habit.dart';

import '../controllers/auth_controller.dart';
import 'helper.dart';

class HabitApi {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> createHabit(Habit habit) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("habits")
          .doc(habit.id)
          .set(habit.toMap());

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }

  static Stream<List<Habit>> getHabits() {
    final results = firestore
        .collection("users")
        .doc(AuthController.to.user.value!.uid)
        .collection("habits")
        .orderBy("id", descending: true)
        .snapshots();

    return results.map((event) => event.docs.map((e) => Habit.fromMap(e.data())).toList());
  }

  static Future<bool> deleteHabit(String id) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("habits")
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
