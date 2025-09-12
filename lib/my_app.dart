import 'package:ecommerce_app/app/modules/language/controller/language_controller.dart';
import 'package:ecommerce_app/app/modules/theme/controller/theme_controller.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/app/themes/app_themes.dart';
import 'package:ecommerce_app/app/translation/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final langController = Get.find<LanguageController>();

    return ScreenUtilInit(
        designSize: const Size(390, 844), // Your Figma/Design Size
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return Obx(()=>GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-commerce App',
              theme: AppThemes.lightTheme, // light theme
              darkTheme: AppThemes.darkTheme, // dark theme
              themeMode: ThemeMode.system, //themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light, // toggle between light and dark mode
              translations:AppTranslation(), // translations for different languages
              fallbackLocale: const Locale('en'), // default fallback locale
              locale: Locale(langController.currentLang.value), // current locale
              initialRoute: AppPages.INITIAL, // initial route of the app
              getPages: AppPages.routes, // list of app routes
            ),
          );
        },
    );
  }
}
