import 'package:ecommerce_app/app/core/constants/app_assets.dart';

class CategoriesModel {
  String image;
  String catName;

  CategoriesModel({
    required this.image,
    required this.catName,
  });
}



List<CategoriesModel> productCategories = <CategoriesModel>[
  CategoriesModel(image: AppAssets.hoodieImg, catName: 'Hoodies'),
  CategoriesModel(image: AppAssets.shotsImg, catName: 'Shorts'),
  CategoriesModel(image: AppAssets.shoesImg, catName: 'Shoes'),
  CategoriesModel(image: AppAssets.bagImg, catName: 'Bags'),
  CategoriesModel(image: AppAssets.accessoriesImg, catName: 'Accessories'),
  CategoriesModel(image: AppAssets.hoodieImg, catName: 'Hoodies'),
];