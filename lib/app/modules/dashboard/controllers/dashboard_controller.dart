import 'package:get/get.dart';

class DashboardController extends GetxController {

  // reactive variable
  RxInt currentIndex = 0.obs;

  void changeTab(int index){
    currentIndex.value = index;
  }
}
