import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  RxBool switchValue = false.obs;
  void changeSwitch(value) {
    switchValue = value;
  }

  RxInt index = 0.obs;
  void chnageIndex(index) {
    index = index;
  }
}
