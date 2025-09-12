import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../home/models/categories_model.dart';

class CategoriesController extends GetxController {
  
  TextEditingController searchController = TextEditingController();

  RxList<CategoriesModel> allCategories = <CategoriesModel>[
    CategoriesModel(image: AppAssets.hoodieImg, catName: 'Hoodies'),
    CategoriesModel(image: AppAssets.shotsImg, catName: 'Shorts'),
    CategoriesModel(image: AppAssets.shoesImg, catName: 'Shoes'),
    CategoriesModel(image: AppAssets.bagImg, catName: 'Bags'),
    CategoriesModel(image: AppAssets.accessoriesImg, catName: 'Accessories'),
  ].obs;

  RxList<CategoriesModel> filteredCategories = <CategoriesModel>[].obs;

  final RxString searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener((){
      searchText.value = searchController.text;
      _filterCategories(searchText.value);
    });
    filteredCategories.assignAll(allCategories);

    // ever(searchText, (_) => _filterCategories());
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }


  void _filterCategories(String query) {
    // final query = searchText.value.toLowerCase();
    if (query.isEmpty) {
      filteredCategories.assignAll(allCategories);
    } else {
      filteredCategories.assignAll(
        allCategories.where(
          (cat) => cat.catName.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  void clearSeach(){
    searchController.clear();
  }
}
