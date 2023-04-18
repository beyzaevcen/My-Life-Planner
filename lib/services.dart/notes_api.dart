import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/note.dart';

import '../controllers/auth_controller.dart';
import 'helper.dart';

class NotesApi {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<bool> createNote(Note note) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("notes")
          .doc(note.id)
          .set(note.toMap());

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }

  static Stream<List<Note>> getNotes() {
    final results = firestore
        .collection("users")
        .doc(AuthController.to.user.value!.uid)
        .collection("notes")
        .orderBy("whenCreated", descending: true)
        .snapshots();

    return results.map((event) => event.docs.map((e) => Note.fromMap(e.data())).toList());
  }

  static Future<bool> updateTodo(Note note) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("notes")
          .doc(note.id)
          .set(note.toMap());

      return true;
    } on FirebaseException catch (err) {
      Helper.showError("error", err.code);
      return false;
    } catch (err) {
      Helper.showError("error", err.toString());
      return false;
    }
  }

  static Future<bool> deleteNote(String id) async {
    try {
      await firestore
          .collection("users")
          .doc(AuthController.to.user.value!.uid)
          .collection("notes")
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
