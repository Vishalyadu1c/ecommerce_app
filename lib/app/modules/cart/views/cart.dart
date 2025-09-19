import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:ecommerce_app/app/modules/login/views/login_screen.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/app/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../widgets/empty_screen.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBackButton(),
        ),
      ),
      body: SafeArea(child: 
      // EmptyScreen(image: AppAssets.bag, message: "Your Cart is Empty"),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  spacing: 10,
                  children: [
                    Align( alignment: AlignmentGeometry.centerRight, child: Text("Remove all",style: Theme.of(context).textTheme.labelLarge,)),
                SizedBox(height: 0.1.h,),
                // item cart
                CustomItemCart(
                  itemImg: AppAssets.cartItem1,
                  itemName: "Men's Harrington Jacket",
                  itemPrice: "\$148",
                  size: "M",
                  color: "Lemon",
                ),
                CustomItemCart(
                  itemImg: AppAssets.cartItem2,
                  itemName: "Men's Coaches Jacket",
                  itemPrice: "\$52",
                  size: "M",
                  color: "Black",
                ),
                  ],
                ),
              ),
          
              Column(
                spacing: 8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",style: Theme.of(context).textTheme.headlineSmall,),
                      Text("\$200",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Cost",style: Theme.of(context).textTheme.headlineSmall,),
                      Text("\$8.00",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tax",style: Theme.of(context).textTheme.headlineSmall,),
                      Text("\$0.00",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),)
                    ],
                  ),
                  Divider(height: 0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style: Theme.of(context).textTheme.headlineSmall,),
                      Text("\$208",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  TextField(
                    decoration: InputDecoration(
                      hint: Text("Enter Coupon Code"),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12).w,
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(AppAssets.discount,),
                      ),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(6).w,
                        padding: EdgeInsets.all(10).w,
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightThemePrimaryColour,
                          shape: BoxShape.circle
                        ),
                        child: Image.asset(AppAssets.arrowRight2,),
                      )

                    ),
                  )
                ],
              ),
              SizedBox(height: 80.h,)
            ],
          ),
        ),
      )
      
      ),
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkThemePrimaryColour
              : AppColors.lightThemeWhiteColour,
          padding: EdgeInsets.all(12).w,
          child: ElevatedButton(
              onPressed: ()=>Get.toNamed(AppRoutes.CHECKOUT),
              child: Text(
                "Checkout",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.lightThemeWhiteColour),
              )),
        ),
    );
  }
}

class CustomItemCart extends StatelessWidget {
  final String itemImg;
  final String itemName;
  final String itemPrice;
  final String size;
  final String color;
  const CustomItemCart({
    super.key,
    required this.itemImg,
    required this.itemName,
    required this.itemPrice,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Row(
        children: [
          Image.asset(itemImg),
          SizedBox(width: 10.w,),
          SizedBox(
            width: 272.w,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(itemName,style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.normal),),
                      Row(
                        spacing: 10,
                        children: [
                          RichText(
                            text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Size - ",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.normal)
                              ),
                              TextSpan(
                                text: size,
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14.sp)
                              ),
                            ]
                          )),
                          RichText(
                            text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Color - ",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.normal)
                              ),
                              TextSpan(
                                text: color,
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14.sp)
                              ),
                            ]
                          )),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(itemPrice,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),),
                    Row(
                      spacing: 6,
                      children: [
                        Container(
                          width: 28.w,
                          height: 28.h,
                          padding: EdgeInsets.all(5).w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightThemePrimaryColour
                          ),
                          child: Image.asset(AppAssets.minus),
                        ),
                        Text("1",),
                         Container(
                          width: 28.w,
                          height: 28.h,
                          padding: EdgeInsets.all(5).w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightThemePrimaryColour
                          ),
                          child: Image.asset(AppAssets.add),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}