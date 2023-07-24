import 'package:dieta_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Colors.teal, //AppSettings.of(context)!.settings.textColorPrimaryLight,
          //fixedColor: G4settings().textColorQuaternaryLight,

          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(size: 32),
          unselectedIconTheme: const IconThemeData(size: 32),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(
              color: Colors.red /* AppSettings.of(context)!.settings.textColorTertiaryLight */, fontSize: 12),
          unselectedLabelStyle: const TextStyle(
              color: Colors.green /* AppSettings.of(context)!.settings.textColorTertiaryLight */, fontSize: 12),
          currentIndex: controller.currentIndex.value,
          onTap: (x) {
            controller.changePage(currentPage: x);
          },
          items: [
            BottomNavigationBarItem(
                label: "Inicio",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 0 && controller.bottonNavIsloading.value == true)
                              ? Colors.orange //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.attach_money)),
                )),
            BottomNavigationBarItem(
                label: "Produtos",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 1 && controller.bottonNavIsloading.value == true)
                              ? Colors.amber //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.inventory_2)),
                )),
            BottomNavigationBarItem(
                label: "Relatórios",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 2 && controller.bottonNavIsloading.value == true)
                              ? Colors.blueGrey //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.assessment_outlined)),
                )),
            BottomNavigationBarItem(
                label: "Compras",
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Container(
                      height: 35,
                      width: Get.size.width / 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: (controller.currentIndex.value == 3 && controller.bottonNavIsloading.value == true)
                              ? Colors.deepPurple //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.fire_truck_sharp)),
                )),
            BottomNavigationBarItem(
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
                              ? Colors.teal //AppSettings.of(context)!.settings.colorPrimaryLight
                              : Colors.transparent),
                      child: const Icon(Icons.auto_graph_outlined)),
                )),
          ],
        )));
  }
}
