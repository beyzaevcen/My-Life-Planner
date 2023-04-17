import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/users_model.dart';
import 'auth_controller.dart';

class SignUpController extends GetxController {
  final name = TextEditingController();
  final mail = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final dateBirth = TextEditingController();
  final gender = TextEditingController();
  final date = DateTime.now().obs;

  final passwordShow = true.obs;
  final passwordShowtwo = true.obs;

  @override
  void onClose() {
    name.clear();
    mail.clear();
    password.clear();
    confirmPassword.clear();
    gender.clear();
    dateBirth.clear();
    dateBirth.dispose();
    super.onClose();
  }

  Future<void> signUp() async {
    if (name.text.isEmpty || mail.text.isEmpty) {
      EasyLoading.showError("There is an empty textfield");
    }
    final user = UsersModel(
      id: "",
      fullName: name.text,
      birthdayDate: date.value,
      email: mail.text, gender: '',
      // gender: gender.value,
    );
    AuthController.to
        .signIn('emailSignUp', email: mail.text.trim(), password: password.text.trim(), user: user);
  }
}
