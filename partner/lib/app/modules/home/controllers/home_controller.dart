import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tab = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  changeTab(int position) {
    tab.value = position;
    update();
  }
}
