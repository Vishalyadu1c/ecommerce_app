// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_SCREEN,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
