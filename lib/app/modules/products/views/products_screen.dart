import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/empty_screen.dart';
import '../controllers/products_controller.dart';

class ProductsScreen extends GetWidget<ProductsController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = Get.arguments ?? '';

    // Filter by category only once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (category.isNotEmpty) {
        controller.fillterByCategory(category);
      } else {
        controller.filteredProducts.value = controller.allProducts;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0).w,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.0,
              children: [
                CustomBackButton(),
                if (controller.filteredProducts.isEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: EmptyScreen(
                        image: AppAssets.search1,
                        message:
                            "Sorry,we could't find any matching result for your search."),
                  )
                else ...[
                  Text(
                    category,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                  Flexible(
                    child: GridView.builder(
                      itemCount: controller.filteredProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 281.h,
                          childAspectRatio: 159.w),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: ()=>Get.toNamed(AppRoutes.PRODUCTVIEW),
                          child: Container(
                            width: 159.w,
                            height: 281.h,
                            margin: EdgeInsets.symmetric(horizontal: 4.0).w,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(8.0).r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 6.0,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.lightGreySecondaryColour,
                                          borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0))
                                              .w,
                                          image: DecorationImage(
                                              image: AssetImage(controller
                                                  .filteredProducts[index]
                                                  .prodImage),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                        right: 5,
                                        top: 5,
                                        child:
                                            Image.asset(AppAssets.outlinedHeart))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0).w,
                                  child: Text(
                                    controller.filteredProducts[index].prodName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 13.sp,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0).w,
                                  child: Row(
                                    spacing: 10,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller
                                            .filteredProducts[index].prodPrice,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      if (controller.filteredProducts[index]
                                              .lesserAmount !=
                                          null)
                                        Text(
                                            controller.filteredProducts[index]
                                                .lesserAmount!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
