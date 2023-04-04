import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final name = TextEditingController();
  final mail = TextEditingController();
  final password = TextEditingController();
  final dateBirth = TextEditingController();
  final male = TextEditingController();
  final date = DateTime.now().obs;
}
