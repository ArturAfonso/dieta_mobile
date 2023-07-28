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
      body: PageView(
          controller: controller.pageController,
          children: const [RefeicoesView(), AlimentosView(), InformacoesView(), MetasView()]),
      bottomNavigationBar: BottomBarHome(controller: controller),
    );
  }
}
