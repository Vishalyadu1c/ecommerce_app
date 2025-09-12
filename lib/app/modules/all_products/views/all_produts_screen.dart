import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/all_products/controllers/all_products_controller.dart';
import 'package:ecommerce_app/app/modules/all_products/widgets/search_all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllProdutsScreen extends GetWidget<AllProductsController> {
  const AllProdutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selected = '';
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: SearchAllProducts()),
          SliverToBoxAdapter(
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
                            onTap: ()=>controller.openFilterSheet(context,sortBy: SortBy.onSale)),
                        BuildChip(
                            SuffixImg:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppAssets.vectorDark
                                    : AppAssets.vectorLight,
                            label: "Price",
                            isSelected: selected == "Price",
                            onTap: ()=>controller.openFilterSheet(context,sortBy: SortBy.price)),
                        BuildChip(
                            SuffixImg:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppAssets.vectorDark
                                    : AppAssets.vectorLight,
                            label: "Sort by",
                            isSelected: selected == "Sort by",
                            onTap: ()=>controller.openFilterSheet(context,sortBy: SortBy.sortBy)),
                        BuildChip(
                            SuffixImg:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppAssets.vectorDark
                                    : AppAssets.vectorLight,
                            label: "Men",
                            isSelected: selected == "Men",
                            onTap: ()=>controller.openFilterSheet(context,sortBy: SortBy.gender)),
                      ],
                    ),
                  ),
                )
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
