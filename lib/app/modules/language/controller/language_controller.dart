import 'package:ecommerce_app/app/data/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  // Reactive variable to hold the current language
  RxString currentLang = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    currentLang.value = StorageService.to.getLanguage() ?? 'en';
  }

  void changeLanguage(String langCode) {
    currentLang.value = langCode;
    Get.updateLocale(Locale(langCode));
    StorageService.to.setLanguage(langCode);
  }
}
