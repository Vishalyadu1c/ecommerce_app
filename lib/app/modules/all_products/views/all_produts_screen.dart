import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/all_products/controllers/all_products_controller.dart';
import 'package:ecommerce_app/app/modules/all_products/widgets/search_all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/empty_screen.dart';

class AllProdutsScreen extends GetWidget<AllProductsController> {
  const AllProdutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selected = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: SearchAllProducts()),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0).w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8.w,
                      children: [
                        BuildChip(
                            prefixImg: AppAssets.filter,
                            isSelected: true, //selected == "Filter",
                            label: '2',
                            onTap: () {}),
                        BuildChip(
                            label: "On Sale",
                            isSelected: selected == "On Sale",
                            onTap: () => controller.openFilterSheet(context,
                                sortBy: SortBy.onSale)),
                        BuildChip(
                            SuffixImg:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppAssets.vectorDark
                                    : AppAssets.vectorLight,
                            label: "Price",
                            isSelected: selected == "Price",
                            onTap: () => controller.openFilterSheet(context,
                                sortBy: SortBy.price)),
                        BuildChip(
                            SuffixImg:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppAssets.vectorDark
                                    : AppAssets.vectorLight,
                            label: "Sort by",
                            isSelected: selected == "Sort by",
                            onTap: () => controller.openFilterSheet(context,
                                sortBy: SortBy.sortBy)),
                        BuildChip(
                            SuffixImg:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppAssets.vectorDark
                                    : AppAssets.vectorLight,
                            label: "Men",
                            isSelected: selected == "Men",
                            onTap: () => controller.openFilterSheet(context,
                                sortBy: SortBy.gender)),
                      ],
                    ),
                  ),
                ),
                Obx(() => controller.filteredProducts.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        child: EmptyScreen(
                            image: AppAssets.search1,
                            message:
                                "Sorry,we could't find any matching result for your search."),
                      )
                    : Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          itemCount: controller.filteredProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  mainAxisExtent: 281.h,
                                  childAspectRatio: 159.w),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.PRODUCTVIEW),
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
                                              color: AppColors
                                                  .lightGreySecondaryColour,
                                              borderRadius: BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(8.0),
                                                      topLeft:
                                                          Radius.circular(8.0))
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
                                            child: Image.asset(
                                                AppAssets.outlinedHeart))
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 4.0).w,
                                      child: Text(
                                        controller
                                            .filteredProducts[index].prodName,
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
                                      padding:
                                          const EdgeInsets.only(left: 4.0).w,
                                      child: Row(
                                        spacing: 10,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            controller.filteredProducts[index]
                                                .prodPrice,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          if (controller.filteredProducts[index]
                                                  .lesserAmount !=
                                              null)
                                            Text(
                                                controller
                                                    .filteredProducts[index]
                                                    .lesserAmount!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
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
                      )),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class BuildChip extends StatelessWidget {
  final String? prefixImg;
  final String? SuffixImg;
  final String? label;
  final bool isSelected;
  final VoidCallback onTap;
  const BuildChip(
      {super.key,
      this.prefixImg,
      this.SuffixImg,
      this.label,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightThemePrimaryColour
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(50).r,
        ),
        child: Row(
          children: [
            if (prefixImg != null)
              Image.asset(
                prefixImg!,
                width: 13,
                height: 13,
              )
            else
              SizedBox(),
            if (label != null)
              Text(
                label!,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.lightThemeWhiteColour
                        : isSelected
                            ? AppColors.lightThemeWhiteColour
                            : AppColors.darkThemeDarkNavBarColour,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              )
            else
              SizedBox(),
            if (SuffixImg != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0).w,
                child: Image.asset(
                  SuffixImg!,
                  width: 13,
                  height: 13,
                ),
              )
            else
              SizedBox(),
          ],
        ),
      ),
    );
  }
}
