import 'package:ecommerce_app/app/data/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Reactive variable to hold the current theme mode
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = StorageService.to.isDarkTheme()!;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    StorageService.to.setDarkTheme(isDarkMode.value);
  }
}
