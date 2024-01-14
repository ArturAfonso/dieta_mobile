import 'package:dieta_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';

class BottomBarHome extends StatelessWidget {
  const BottomBarHome({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx((() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              Theme.of(context).colorScheme.onPrimary, //AppSettings.of(context)!.settings.textColorPrimaryLight,
          //fixedColor: G4settings().textColorQuaternaryLight,

          selectedItemColor: Theme.of(context).colorScheme.primary,
          selectedIconTheme: const IconThemeData(size: 32),
          unselectedIconTheme: const IconThemeData(size: 32),
          unselectedItemColor: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          selectedLabelStyle: const TextStyle(
              color: Colors.red /* AppSettings.of(context)!.settings.textColorTertiaryLight */, fontSize: 12),
          unselectedLabelStyle: const TextStyle(
              color: Colors.green /* AppSettings.of(context)!.settings.textColorTertiaryLight */, fontSize: 12),
          currentIndex: controller.currentIndex.value,
          onTap: (x) {
            controller.changePage(page: x);
          },
          items: [
            BottomNavigationBarItem(
                label: "Refeições",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 0 && controller.bottonNavIsloading.value == true)
                              ? Colors.yellow //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Ionicons.restaurant)),
                )),
            BottomNavigationBarItem(
                label: "Alimentos",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 1 && controller.bottonNavIsloading.value == true)
                              ? Colors.yellow //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.menu_book_outlined)),
                )),
            BottomNavigationBarItem(
                label: "Informações",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 2 && controller.bottonNavIsloading.value == true)
                              ? Colors.yellow //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Ionicons.fitness_sharp)),
                )),
            BottomNavigationBarItem(
                label: "Metas",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 3 && controller.bottonNavIsloading.value == true)
                              ? Colors.yellow //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.calculate)),
                )),
            /*    BottomNavigationBarItem(
                label: "Financeiro",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 4 && controller.bottonNavIsloading.value == true)
                              ? Colors.yellow //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.auto_graph_outlined)),
                )), */
          ],
        )));
  }
}
