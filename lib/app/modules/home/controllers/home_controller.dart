import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool bottonNavIsloading = false.obs;

  void changePage({
    required int currentPage,
    /* required int page */
  }) {
    bottonNavIsloading.value = true;
    Future.delayed(const Duration(milliseconds: 100), (() {
      bottonNavIsloading.value = false;
    }));

    currentIndex.value = currentPage;
    //pageController.jumpToPage(currentPage);
    print(currentIndex.value);
    if (currentIndex.value == 0) {
      print("go to vendas page");
      //Get.toNamed(Routes.VENDAS_PAGE);
    }
    if (currentIndex.value == 1) {
      // Get.toNamed(Routes.PRODUCTS);
      print("go to products page");
    }
    if (currentIndex.value == 2) {
      //Get.toNamed(Routes.PRODUCTS);
      print("go to relatorios page");
    }
    if (currentIndex.value == 3) {
      //Get.toNamed(Routes.PRODUCTS);
      print("go to compras page");
    }
    if (currentIndex.value == 4) {
      //Get.toNamed(Routes.PRODUCTS);
      print("go to financeiro page");
    }
  }
}
