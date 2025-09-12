import 'package:ecommerce_app/app/modules/orders/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../widgets/empty_screen.dart';

class OrderScreen extends GetWidget<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Orders',style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: SafeArea(child: EmptyScreen(image: AppAssets.checkOut, message: "No Order yet"),),
    );
  }
}