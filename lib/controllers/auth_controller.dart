import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/users_model.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final user = Rxn<User>();
  final profile = Rxn<UsersModel>();

  bool onResendModal = false;
  final loginLoading = true.obs;

  String? appleName;
}
