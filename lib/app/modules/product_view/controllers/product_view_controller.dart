import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:get/get.dart';

import '../../home/models/product_card_model.dart';

class ProductViewController extends GetxController {
  RxList<ProductCardModel> products = <ProductCardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fatchProducts();
  }

  void fatchProducts() {
    products.value = [
      ProductCardModel(
          onSale: true,
          prodImage: AppAssets.jacketImg,
          prodName: "Men's Harrington Jacket",
          prodPrice: '\$148.00',
          category: 'Jackets'),
      ProductCardModel(
          onSale: true,
          prodImage: AppAssets.jacketO1Img,
          prodName: "Men's Harrington Jacket",
          prodPrice: '\$148.00',
          category: 'Jackets'),
      ProductCardModel(
          onSale: true,
          prodImage: AppAssets.jacket02Img,
          prodName: "Men's Harrington Jacket",
          prodPrice: '\$148.00',
          category: 'Jackets'),
    ];
  }
}
