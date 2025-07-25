import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightThemePrimaryColour,
      body: Center(
        child: Text(
          'Welcome to E-commerce App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}