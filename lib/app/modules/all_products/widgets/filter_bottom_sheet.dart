import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/all_products/controllers/all_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  final SortBy sort;
  FilterBottomSheet({super.key,required this.sort});

  final filterCtrl = Get.find<AllProductsController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 390,
      width: double.infinity,
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkThemePrimaryColour
          : AppColors.lightThemeWhiteColour,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20).r,
          topLeft: Radius.circular(20).r
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: Text("Clear",style: Theme.of(context).textTheme.labelMedium,)),
              Text(sort==SortBy.onSale?"Deals":sort==SortBy.price?"Price":sort==SortBy.sortBy?"Sort by":"Gender", style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          SizedBox(height: 10),
          if(sort == SortBy.onSale)
          Column(
            spacing: 12.h,
            children: [
              FilterOption(title: "On Sale"),
              FilterOption(title: "Free Shipping Eligible"),
            ],
          )
         else if(sort == SortBy.price)
          Column(
            spacing: 12.h,
            children: [
              FilterOption(title: "Min"),
              FilterOption(title: "Max"),
            ],
          )
          else if(sort == SortBy.sortBy)
          Column(
            spacing: 12.h,
            children: [
              FilterOption(title: "Recommended"),
              FilterOption(title: "Newest"),
              FilterOption(title: "Lowest - Highest Price"),
              FilterOption(title: "Highest - Lowest Price"),
            ],
          )
          else if(sort == SortBy.gender)
          Column(
            spacing: 12.h,
            children: [
              FilterOption(title: "Men"),
              FilterOption(title: "Women"),
              FilterOption(title: "Kids"),
            ],
          )
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  FilterOption({super.key, required this.title});

  final filterCtrl = Get.find<AllProductsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => filterCtrl.selectedSort.value = title,
      child: Obx(
        () => Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.0).w,
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
              color: filterCtrl.selectedSort.value == title
                  ? AppColors.lightThemePrimaryColour
                  : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(100).r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: filterCtrl.selectedSort.value == title
                        ? AppColors.lightThemeWhiteColour
                        : Theme.of(context).brightness == Brightness.dark
                            ? AppColors.lightThemeWhiteColour
                            : AppColors.darkThemePrimaryColour),
              ),
              if (filterCtrl.selectedSort.value == title)
                Icon(
                  Icons.check,
                  size: 16,
                  color: AppColors.lightThemeWhiteColour,
                )
              else
                SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
