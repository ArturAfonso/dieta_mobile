import 'package:dieta_mobile/app/modules/alimentos/views/alimentos_view.dart';
import 'package:dieta_mobile/app/modules/home/components/bottom_bar.dart';
import 'package:dieta_mobile/app/modules/informacoes/views/informacoes_view.dart';
import 'package:dieta_mobile/app/modules/metas/views/metas_view.dart';
import 'package:dieta_mobile/app/modules/refeicoes/views/refeicoes_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Bem-vindo à Home Page!'),
      ),
    );
  }
/* 
  @override
  Widget build(BuildContext context) {
    if (controller.cAuth.preencherUser == true) {
      Future.delayed(const Duration(seconds: 1), () {
        if (controller.pageController.hasClients) {
          controller.changePage(page: 2);
        }
      });
    } else {
      print(controller.cAuth.userLogado!.peso.toString());
    }
    return Scaffold(
      body: PageView(
          key: controller.formKeys[controller.currentIndex.value],
          onPageChanged: (s) {
            print(s);
          },
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [RefeicoesView(), AlimentosView(), InformacoesView(), MetasView()]),
      bottomNavigationBar: BottomBarHome(controller: controller),
    );
  } */
}
