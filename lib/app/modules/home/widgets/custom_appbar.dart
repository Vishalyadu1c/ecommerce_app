import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_search_field.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 👤 Avatar
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: AppAssets.uers,
              width: 38.w,
              height: 38.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(10.0).w,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).w,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                Text(
                  'Men',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 14.sp),
                ),
                SizedBox(width: 4.w),
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? AppAssets.downArrow2
                      : AppAssets.downArrow,
                  width: 12.w,
                  height: 12.h,
                ),
              ],
            ),
          ),

          Container(
            height: 38.h,
            width: 38.h,
            padding: EdgeInsets.all(10).w,
            decoration: BoxDecoration(
              color: AppColors.lightThemePrimaryColour,
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppAssets.shopingBag),
          ),
        ],
      ),
    );
  }
}



class CustomFloatingSearchBar extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10.0).w,
      child: CustomSearchField(
        readOnly: true,
        onTap: ()=>Get.toNamed(AppRoutes.AllPRODUCTS),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

