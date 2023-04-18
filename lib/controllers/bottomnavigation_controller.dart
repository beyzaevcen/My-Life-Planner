import 'package:get/get.dart';
import 'package:notes_app/screens/settings_page.dart';
import 'package:notes_app/widgets/home_widget.dart';

class BottomNavigationController extends GetxController {
  var currentindex = 0.obs;
  final pages = [
    const HomeWidget(),
    const SettingsPage(),
  ];
}
