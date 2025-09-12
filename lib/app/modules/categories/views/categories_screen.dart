import 'package:ecommerce_app/app/core/constants/app_assets.dart';
import 'package:ecommerce_app/app/modules/categories/controllers/categories_controller.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:ecommerce_app/app/translation/app_translation_keys.dart';
import 'package:ecommerce_app/app/widgets/custom_sticky_seach_bar.dart';
import 'package:ecommerce_app/app/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomStickySeachBar()),
            

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0).w,
              child: Obx(()=>controller.filteredCategories.isEmpty ? 
              SizedBox(
                height: MediaQuery.of(context).size.height-120,
                child: EmptyScreen(image: AppAssets.search1, message: "Sorry,we could't find any matching result for your search."),
              )
               : Column(
                  spacing: 14,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppTranslationKeys.catText.tr,style: Theme.of(context).textTheme.headlineMedium,),
                
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = controller.filteredCategories[index];
                      return GestureDetector(
                        onTap: ()=>Get.toNamed(AppRoutes.PRODUCTS,arguments: category.catName),
                        child: CustomCatCard(Img: category.image, text: category.catName));
                    },)
                  ],
                ),
              ),
            ),
          ),
        ],
      )
      ),
    );
  }
}

class CustomCatCard extends StatelessWidget {
  final String Img;
  final String text;
  const CustomCatCard({
    super.key,
    required this.Img,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10).w,
      margin: EdgeInsets.only(top: 12).w,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0).w
      ),
      child: Row(
        spacing: 10,
        children: [
          Image.asset(Img,width: 40,height: 40,),
          Text(text,style: Theme.of(context).textTheme.labelMedium,)
        ],
      ),
    );
  }
}