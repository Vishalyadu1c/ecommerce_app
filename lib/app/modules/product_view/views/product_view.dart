import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../controllers/product_view_controller.dart';

class ProductView extends GetWidget<ProductViewController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 42,
                        height: 42,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                            Theme.of(context).brightness == Brightness.dark
                                ? AppAssets.likeWhite
                                : AppAssets.likeBlack),
                      ),
                    ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBackButton(),
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 10.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomBackButton(),
              //     GestureDetector(
              //       onTap: () => Get.back(),
              //       child: Container(
              //         width: 42,
              //         height: 42,
              //         padding: EdgeInsets.all(12),
              //         decoration: BoxDecoration(
              //           color: Theme.of(context).cardColor,
              //           shape: BoxShape.circle,
              //         ),
              //         child: Image.asset(
              //             Theme.of(context).brightness == Brightness.dark
              //                 ? AppAssets.likeWhite
              //                 : AppAssets.likeBlack),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  height: 248.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return Container(
                        width: 161.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(product.prodImage),
                                fit: BoxFit.cover)),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10.h,
                      );
                    },
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Men's Harrington Jacket",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '\$148',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightThemePrimaryColour),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0).w,
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Size",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Text(
                          "S",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                            Theme.of(context).brightness == Brightness.dark
                                ? AppAssets.downArrow2
                                : AppAssets.downArrow)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0).w,
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Color",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Container(
                          width: 18.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                              color: AppColors.jacketColor,
                              shape: BoxShape.circle),
                        ),
                        Image.asset(
                            Theme.of(context).brightness == Brightness.dark
                                ? AppAssets.downArrow2
                                : AppAssets.downArrow)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0).w,
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(12).w,
                          decoration: BoxDecoration(
                              color: AppColors.lightThemePrimaryColour,
                              shape: BoxShape.circle),
                          child: Image.asset(AppAssets.minus),
                        ),
                        Text(
                          "1",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Container(
                          width: 40.w,
                          height: 40.h,
                          padding: EdgeInsets.all(12).w,
                          decoration: BoxDecoration(
                              color: AppColors.lightThemePrimaryColour,
                              shape: BoxShape.circle),
                          child: Image.asset(AppAssets.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 12.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Shipping & Returns",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Free standard shipping and free 60-day returns",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 12.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Reviews",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "4.5 Ratings",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "213 Reviews",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 12.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomReviewCard(
                name: "Alex Morgan",
                description:
                    "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                userImg: AppAssets.reviewUser1,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomReviewCard(
                name: "Alex Morgan",
                description:
                    "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                userImg: AppAssets.reviewUser2,
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      )),
      resizeToAvoidBottomInset: false,
      bottomSheet: SafeArea(
        child: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkThemePrimaryColour
              : AppColors.lightThemeWhiteColour,
          padding: EdgeInsets.all(12).w,
          child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$148",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.lightThemeWhiteColour),
                    ),
                    Text(
                      "Add to Bag",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.lightThemeWhiteColour),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class CustomReviewCard extends StatelessWidget {
  final String name;
  final String description;
  final String userImg;

  const CustomReviewCard(
      {super.key,
      required this.name,
      required this.description,
      required this.userImg});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Image.asset(
                  userImg,
                  width: 40.w,
                  height: 40.h,
                ),
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16.sp),
                )
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Image.asset(
                  AppAssets.star,
                  width: 16.w,
                  height: 16.h,
                ),
                Image.asset(
                  AppAssets.star,
                  width: 16.w,
                  height: 16.h,
                ),
                Image.asset(
                  AppAssets.star,
                  width: 16.w,
                  height: 16.h,
                ),
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? AppAssets.starDark
                      : AppAssets.starLight,
                  width: 16.w,
                  height: 16.h,
                ),
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? AppAssets.starDark
                      : AppAssets.starLight,
                  width: 16.w,
                  height: 16.h,
                ),
              ],
            )
          ],
        ),
        Text(description,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 12.sp)),
        Text(
          "12days ago",
          style:
              Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 12.sp),
        )
      ],
    );
  }
}
