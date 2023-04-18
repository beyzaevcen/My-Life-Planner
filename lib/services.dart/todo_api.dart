import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/todo.dart';

import '../controllers/auth_controller.dart';
import 'helper.dart';

class ToDoApi {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> createTodo(ToDo todo) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("todo")
          .doc(todo.whenCreated)
          .set(todo.toMap());

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }

  static Stream<List<ToDo>> getTodos() {
    final results = firestore
        .collection("users")
        .doc(AuthController.to.user.value!.uid)
        .collection("todo")
        .orderBy("whenCreated", descending: true)
        .snapshots();

    return results.map((event) => event.docs.map((e) => ToDo.fromMap(e.data())).toList());
  }

  static Future<bool> updateTodo(ToDo todo) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("todo")
          .doc(todo.id)
          .set(todo.toMap());

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }

  static Future<bool> deleteToDo(String id) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("todo")
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
