import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAllNamed(Routes.LOGIN);
    });
    super.onInit();
  }

  // @override
  // void onReady() {
  //   // if (  != null)
  //   if (null) {
  //     Future.delayed(const Duration(milliseconds: 500), () {
  //       Get.offAllNamed(Routes.HOME);
  //       //Get.offAllNamed(Routes.DASHBOARD);
  //     });
  //   } else {
  //     Get.offAllNamed(Routes.LOGIN);
  //   }
  //   super.onReady();
  //   print("00000000000000008>>>");
  // }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
