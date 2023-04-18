import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/controllers/auth_controller.dart';
import 'package:notes_app/controllers/global_bindings.dart';
import 'package:notes_app/widgets/root_wrapper.dart';

import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox("notes");
  await Firebase.initializeApp(
    name: "my-life-planner",
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootWrapper(),
      initialBinding: GlobalBindings(),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: FlutterEasyLoading(child: child));
      },
    );
  }
}
