import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<Map<String, String>> _navItems = const [
    {
      'iconLight': 'assets/images/home.png',
      'iconDark': 'assets/images/home2.png',
      'selectedIcon': 'assets/images/selected_home.png',
      'label': 'Home',
    },
    {
      'iconLight': 'assets/images/notification.png',
      'iconDark': 'assets/images/notification2.png',
      'selectedIcon': 'assets/images/selected_notification.png',
      'label': 'Notifiaction',
    },
    {
      'iconLight': 'assets/images/order.png',
      'iconDark': 'assets/images/order2.png',
      'selectedIcon': 'assets/images/selected_order.png',
      'label': 'order',
    },
    {
      'iconLight': 'assets/images/profile.png',
      'iconDark': 'assets/images/profile2.png',
      'selectedIcon': 'assets/images/selected_profile.png',
      'label': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      height: 54,
      destinations: List.generate(_navItems.length, (index) {
        final item = _navItems[index];
        final isSelected = currentIndex == index;
        final iconPath = isSelected
            ? item['selectedIcon']!
            : (Theme.of(context).brightness == Brightness.dark
                ? item['iconDark']!
                : item['iconLight']!);
        return NavigationDestination(
          icon: Image.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
          label: item['label'].toString(),
        );
      }),
    );
  }
}
