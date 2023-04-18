import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/auth_controller.dart';

import '../screens/home_page.dart';
import '../screens/login_page.dart';

class RootWrapper extends GetView<AuthController> {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.user.value != null ? const HomePage() : const LoginPage());
  }
}
