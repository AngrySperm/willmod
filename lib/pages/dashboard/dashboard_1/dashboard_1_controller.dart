import 'package:get/get.dart';

class WiljosDashboard1Controller extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  void onBottomBarItemTapped(int index) {
    selectedIndex.value = index;
  }
}
