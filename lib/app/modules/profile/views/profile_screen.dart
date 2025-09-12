import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).w,
        child: Column(
          spacing: 12,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: AppAssets.uers,
                  width: 82.w,
                  height: 82.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(24.0).w,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8.0).r),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 6.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Glibert Jones',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Gliertjones001@gmail.com',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '121-224-7890',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: GestureDetector(
                      onTap: (){},
                      child: Text(
                        'Edit',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.lightThemePrimaryColour,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ),
                  )
                ],
              ),
            ),
            CustomCard(
              name: 'Address',
            ),
            CustomCard(
              name: 'Wishlist',
            ),
            CustomCard(
              name: 'Payment',
            ),
            CustomCard(
              name: 'help',
            ),
            CustomCard(
              name: 'Suport',
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: (){},
              child: Text(
                'Sign Out',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String name;
  const CustomCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16).w,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8.0).r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 15.sp),
          ),
          Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? AppAssets.arrowRight2
                : AppAssets.arrowRight,
            width: 20,
            height: 20,
          )
        ],
      ),
    );
  }
}
