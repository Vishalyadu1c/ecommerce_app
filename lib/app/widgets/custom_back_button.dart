import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/app_assets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 42,
        height: 42,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(Theme.of(context).brightness == Brightness.dark ? AppAssets.backArrow2 : AppAssets.backArrow),
      ),
    );
  }
}