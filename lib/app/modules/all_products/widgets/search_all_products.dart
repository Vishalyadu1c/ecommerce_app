import 'package:ecommerce_app/app/modules/all_products/controllers/all_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_search_field.dart';

class SearchAllProducts extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final controller = Get.find<AllProductsController>();
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10.0).w,
      child: Row(
        spacing: 6.0,
        children: [
          CustomBackButton(),
          Expanded(
              child: CustomSearchField(
                autofocus: true,
            onChanged: (value) {
              controller.searchText.value = value;
            },
            controller: controller.searchController,
            suffixIcon: controller.searchController.text.isNotEmpty
                ? IconButton(onPressed: ()=>controller.clearSeach(), icon: Icon(Icons.close,size: 18.w,))
                : null,
          ))
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}