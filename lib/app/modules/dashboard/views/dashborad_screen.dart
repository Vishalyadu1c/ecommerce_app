
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/notification/views/notification_screen.dart';
import '../../home/views/home_screen.dart';
import '../../orders/views/order_screen.dart';
import '../../profile/views/profile_screen.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class DashboradScreen extends GetWidget<DashboardController> {
  DashboradScreen({super.key});

  final List<Widget> pages = [
    HomeScreen(),
    NotificationScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: CustomBottomNavBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab
        )
      ));
  }
}
