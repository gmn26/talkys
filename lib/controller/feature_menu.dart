import 'package:get/get.dart';

class FeatureMenuController extends GetxController {
  var activeMenu = ''.obs;

  void changeMenu(menu) {
    activeMenu.value = menu;
  }

  void closeMenu() {
    activeMenu.value = '';
  }
}