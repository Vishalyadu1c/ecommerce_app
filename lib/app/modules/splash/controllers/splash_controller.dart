import 'dart:async';

import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.LOGIN);
    });
  }
}
