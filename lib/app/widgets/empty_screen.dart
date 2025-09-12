import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyScreen extends StatelessWidget {
  final String image;
  final String message;
  const EmptyScreen({super.key, required this.image, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Image.asset(image),
          Text(message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24.sp),),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(160,40))
            ),
            onPressed: (){}, child: Text("Explore Categories",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.lightThemeWhiteColour),))
        ],
      ),
    );
  }
}
