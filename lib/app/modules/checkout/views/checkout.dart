import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_back_button.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Checkout',style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBackButton(),
        ),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 72.h,
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0).r
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Shipping address",style: Theme.of(context).textTheme.titleSmall,),
                      Text("Add Shipping address",style: Theme.of(context).textTheme.titleLarge,)
                    ],
                  ),
                  Image.asset(AppAssets.arrowRight)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}