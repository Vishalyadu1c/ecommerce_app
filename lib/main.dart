import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/data/services/storage_service.dart';
import 'app/modules/language/controller/language_controller.dart';
import 'app/modules/theme/controller/theme_controller.dart';
import 'my_app.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await initServices();

  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<StorageService>(() async => StorageService());
  await Get.putAsync<ThemeController>(() async => ThemeController());
  await Get.putAsync<LanguageController>(() async => LanguageController());
}
