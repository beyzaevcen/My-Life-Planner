import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
