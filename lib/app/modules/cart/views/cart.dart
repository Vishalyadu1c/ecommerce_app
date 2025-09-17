import 'package:ecommerce_app/app/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(child: EmptyScreen(image: AppAssets.bag, message: "Your Cart is Empty"),),
    );
  }
}