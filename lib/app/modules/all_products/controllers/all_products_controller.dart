import 'package:ecommerce_app/app/modules/home/models/product_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../widgets/filter_bottom_sheet.dart';

enum SortOption { recommended, newest, lowToHigh, highToLow }
enum GenderOption { men, women, kids }
enum DealsOption { onSale, freeShipping }
enum PriceOption {min, max}

class AllProductsController extends GetxController {
    TextEditingController searchController = TextEditingController();

    RxInt selectedCount = 0.obs;
    RxString selected = ''.obs;

    final RxString searchText = ''.obs;

     var selectedSort = ''.obs;

    
    @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }


    void clearSeach(){
    searchController.clear();
  }

  void openFilterSheet(BuildContext context,{required SortBy sortBy}) {
    Get.bottomSheet(
      enableDrag: false,
      FilterBottomSheet(sort: sortBy,),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  //  ===================================================================

  RxList<ProductCardModel> products = <ProductCardModel>[].obs;
  RxList<ProductCardModel> filteredProducts = <ProductCardModel>[].obs;


  var sortOption = SortOption.recommended.obs;
  var genderOption = GenderOption.men.obs;
  var dealsOption = <DealsOption>{}.obs; // Can select multiple
  var minPrice = 0.0.obs;
  var maxPrice = double.infinity.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    products.value = [
    ProductCardModel(onSale: true, prodImage: AppAssets.jacketImg, prodName: "Men's Harrington Jacket", prodPrice: '\$148.00',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.sliperImg, prodName: "Max carro Men's Slides", prodPrice: '\$55.00',lesserAmount: '\$100.97',category:'Slepers'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket2Img, prodName: "Men's Coaches Jacket", prodPrice: '\$66.97',category:'Jackets'),

    ProductCardModel(onSale: true, prodImage: AppAssets.jacket3Img, prodName: "Nike Unscripted", prodPrice: '\$120.00',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket4Img, prodName: "Nike SB", prodPrice: '\$100.00',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.lowerImg, prodName: "Nike Windrunner", prodPrice: '\$52.97',category:'Jackets'),

    ProductCardModel(onSale: true, prodImage: AppAssets.hoodie1, prodName: "Men's Fleece Pullover Hoodie", prodPrice: '\$100.00',category:'Hoodies'),
    ProductCardModel(onSale: true, prodImage: AppAssets.hoodie2, prodName: "Fleece Pullover Skate Hoddie", prodPrice: '\$150.97',category:'Hoodies'),
    ProductCardModel(onSale: true, prodImage: AppAssets.hoodie3, prodName: "Fleece Shate Hoodie", prodPrice: '\$110.00',category:'Hoodies'),
    ProductCardModel(onSale: true, prodImage: AppAssets.hoodie4, prodName: "Men's Ice-Day Pullover Hoddie", prodPrice: '\$128.97',category:'Hoodies'),
    ProductCardModel(onSale: true, prodImage: AppAssets.hoodie5, prodName: "Men's Monogram Hoodie", prodPrice: '\$52.97',lesserAmount: '\$70.00',category:'Hoodies'),
    ProductCardModel(onSale: true, prodImage: AppAssets.hoodie6, prodName: "Men's Pullover Basketball Hoodie", prodPrice: '\$105.00',category:'Hoodies'),

    ProductCardModel(onSale: true, prodImage: AppAssets.jacket5, prodName: "Club Fleece Mens Jacket", prodPrice: '\$56.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jackte6, prodName: "skate Jacket", prodPrice: '\$150.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket7, prodName: "Therma Fit Puffer Jacket", prodPrice: '\$280.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket8, prodName: "Men's Workwere Jacket", prodPrice: '\$128.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket9, prodName: "Women's  Jacket", prodPrice: '\$208.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket10, prodName: "Women's  Jacket", prodPrice: '\$258.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.jacket11, prodName: "Women's  Jacket", prodPrice: '\$300.97',category:'Jackets'),
    ProductCardModel(onSale: true, prodImage: AppAssets.combo, prodName: "Women's  combo", prodPrice: '\$450.97',category:'Combo'),

    ProductCardModel(onSale: true, prodImage: AppAssets.tshirt1, prodName: "Men's T-Shirt", prodPrice: '\$45.00',category:'T-Shirts'),
    ProductCardModel(onSale: true, prodImage: AppAssets.tshirt2, prodName: "Men's Skate T-Shirt", prodPrice: '\$45.00',category:'T-Shirts'),
    ProductCardModel(onSale: true, prodImage: AppAssets.tshirt3, prodName: "Men's Full T-Shirt", prodPrice: '\$85.00',category:'T-Shirts'),
    ProductCardModel(onSale: true, prodImage: AppAssets.tshirt4, prodName: "Men's Full T-Shirt  ", prodPrice: '\$200.97',category:'T-Shirts'),
    ProductCardModel(onSale: true, prodImage: AppAssets.tshirt5, prodName: "Women's T-Shirt", prodPrice: '\$150.00',category:'T-Shirts'),
    ProductCardModel(onSale: true, prodImage: AppAssets.tshirt6, prodName: "Women's T-Shirt", prodPrice: '\$150.00',category:'T-Shirts'),

    ProductCardModel(onSale: true, prodImage: AppAssets.bag1, prodName: "Nike Fuel Pack", prodPrice: '\$35.00',lesserAmount: '\$70.00',category:'Bags'),
    ProductCardModel(onSale: true, prodImage: AppAssets.goggle1, prodName: "Nike Show x Rush", prodPrice: '\$105.00',category:'Goggles')
  ];

    applyFilters();
  }

  void applyFilters() {
    var list = products.where((p) {
      // Gender filter
      if (p.category.toLowerCase() != genderOption.value.name) return false;

      // Deals filter
      if (dealsOption.contains(DealsOption.onSale) && !p.onSale) return false;

      // Price filter
      if (double.parse(p.prodPrice) < minPrice.value || double.parse(p.prodPrice) > maxPrice.value) return false;

      return true;
    }).toList();

    // Sorting
    switch (sortOption.value) {
      case SortOption.lowToHigh:
        list.sort((a, b) => a.prodPrice.compareTo(b.prodPrice));
        break;
      case SortOption.highToLow:
        list.sort((a, b) => b.prodPrice.compareTo(a.prodPrice));
        break;
      default:
        break;
    }

    filteredProducts.assignAll(list);
  }

  void setSortOption(SortOption option) {
    sortOption.value = option;
    applyFilters();
  }

  void setGender(GenderOption gender) {
    genderOption.value = gender;
    applyFilters();
  }

  void toggleDeal(DealsOption deal) {
    if (dealsOption.contains(deal)) {
      dealsOption.remove(deal);
    } else {
      dealsOption.add(deal);
    }
    applyFilters();
  }

  void setPriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
    applyFilters();
  }

  void clearFilters() {
    sortOption.value = SortOption.recommended;
    genderOption.value = GenderOption.men;
    dealsOption.clear();
    minPrice.value = 0.0;
    maxPrice.value = double.infinity;
    applyFilters();
  }

}


enum SortBy{onSale,price,sortBy,gender}