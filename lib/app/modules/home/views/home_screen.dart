import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce_app/app/modules/home/models/categories_model.dart';
import 'package:ecommerce_app/app/modules/home/models/product_card_model.dart';
import 'package:ecommerce_app/app/modules/home/widgets/custom_appbar.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers:[ 
          SliverAppBar(
            leading: SizedBox(),
            pinned: false,
            expandedHeight: 60.h, // Full height when expanded
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomHomeAppBar(),
            ),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: CustomFloatingSearchBar()),

          SliverToBoxAdapter(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                padding: const EdgeInsets.only(left:12.0,bottom: 18,right: 12.0,top: 24).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 15.sp)),
                        GestureDetector(
                          onTap: ()=>Get.toNamed(AppRoutes.CATEGORIES),
                          child: Text('See All',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.normal))),
                      ],
                    ),
                  ),
                  Container(
                    height: 98.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12.0).w,
                    child: ListView.builder(
                      itemCount: productCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final  product = productCategories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right:14.0).w,
                        child: GestureDetector(
                          onTap: ()=>Get.toNamed(AppRoutes.PRODUCTS,arguments:product.catName),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8.0,
                            children: [
                              Image.asset(product.image,width: 56.w,height: 56.h,),
                              Text(product.catName,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),)
                            ],
                          ),
                        ),
                      );
                    },),
                  )
                ],
              ),
          
              // top selling
              Column(
                children: [
                  Padding(
                padding: const EdgeInsets.only(left:12.0,bottom: 18,right: 12.0,top: 24).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Selling',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp)),
                        Text('See All',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp,fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  Container(
                    height: 284.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.0).w,
                    child: ListView.builder(
                      itemCount: topSellingProd.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()=>Get.toNamed(AppRoutes.PRODUCTVIEW),
                        child: Container(
                          width: 159.w,
                          height: 281.h,
                          margin: EdgeInsets.symmetric(horizontal:4.0).w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(8.0).r
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 6.0,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                height: 220.h,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGreySecondaryColour,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0)
                                  ).w,
                                  image: DecorationImage(image: AssetImage(topSellingProd[index].prodImage),fit: BoxFit.cover)
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Image.asset(AppAssets.outlinedHeart))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:4.0).w,
                                child: Text(topSellingProd[index].prodName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:4.0).w,
                                child: Row(
                                  spacing: 10,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(topSellingProd[index].prodPrice, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w600),),
                                    if(topSellingProd[index].lesserAmount != null)
                                    Text(topSellingProd[index].lesserAmount!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w600,decoration: TextDecoration.lineThrough)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },),
                  ),
                ],
              ),
          
              // new In
              Column(
                children: [
                  Padding(
                padding: const EdgeInsets.only(left:12.0,bottom: 18,right: 12.0,top: 24).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New In',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp)),
                        Text('See All',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp,fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  // top selling
                  Container(
                    height: 281.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.0).w,
                    child: ListView.builder(
                      itemCount: newInProd.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()=>Get.toNamed(AppRoutes.PRODUCTVIEW),
                        child: Container(
                          width: 159.w,
                          height: 281.h,
                          margin: EdgeInsets.symmetric(horizontal:4.0).w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(8.0).r
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 6.0,
                            children: [
                               Stack(
                                children: [
                                  Container(
                                height: 220.h,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGreySecondaryColour,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0)
                                  ).r,
                                  image: DecorationImage(image: AssetImage(newInProd[index].prodImage),fit: BoxFit.cover)
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Image.asset(AppAssets.outlinedHeart))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:4.0).w,
                                child: Text(newInProd[index].prodName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                               ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:4.0).w,
                                child: Row(
                                  spacing: 10,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(newInProd[index].prodPrice, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w600),),
                                    if(newInProd[index].lesserAmount != null)
                                    Text(newInProd[index].lesserAmount!, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w600,decoration: TextDecoration.lineThrough)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },),
                  ),
                ],
              ),
              SizedBox(height:10.h,)
            ],
          ),
        ),
        ]
      )),
    );
  }
}



class _CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _CustomAppBarDelegate({required this.child, required this.height});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(height: height, child: child);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}


class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Text("Search", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
