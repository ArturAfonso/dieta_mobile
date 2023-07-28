import 'package:dieta_mobile/app/data/models/alimento_model.dart';
import 'package:dieta_mobile/app/data/models/refeicao_model.dart';
import 'package:dieta_mobile/app/data/shared/dieta_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool bottonNavIsloading = false.obs;
  PageController pageController = PageController(initialPage: 0);

  RefeicaoModel refeicao = RefeicaoModel(alimentos: [
    AlimentoModel(descricao: "pao", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4),
    AlimentoModel(descricao: "maça", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4),
    AlimentoModel(descricao: "queijo", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4)
  ]);
  @override
  void onInit() {
    teste();
    super.onInit();
  }

  void teste() {
    /* print("proteina: ${refeicao.totalProteinas()}");
    print("carbo: ${refeicao.totalCarboidratos()}");
    print("gordura: ${refeicao.totalGorduras()}");
    print("total calorias: ${refeicao.totalCalorias()}");
    print("Refeições proteina total: ${DietaUtils.proteinaGeral([refeicao])}");
    print("Refeições proteina grama kilo: ${DietaUtils.proteinaGramaKilo([refeicao])}");
    print("Refeições carbo total: ${DietaUtils.carboGeral([refeicao])}");
    print("Refeições carbo grama kilo: ${DietaUtils.carboGramaKilo([refeicao])}");
    print("Refeições gordura total: ${DietaUtils.gorduraGeral([refeicao])}");
    print("Refeições gordura grama kilo: ${DietaUtils.gorduraGramaKilo([refeicao])}"); */
    DietaUtils.calcularGCD(intensidade: 'Sedentário', altura: 173, idade: 30, peso: 100, sexo: "H");

    print(DietaUtils.metaProteina(meta: 1.6, peso: 100));
    print(DietaUtils.proteinaAlcancadaMenosMetaProteina(
        meta: DietaUtils.metaProteina(meta: 1.6, peso: 100),
        alcancado: DietaUtils.proteinaGeral([refeicao, refeicao, refeicao])));
  }

  void changePage({required int page}) {
    bottonNavIsloading.value = true;
    Future.delayed(const Duration(milliseconds: 100), (() {
      bottonNavIsloading.value = false;
    }));

    currentIndex.value = page;
    pageController.jumpToPage(page);
    /*    print(currentIndex.value);
    if (currentIndex.value == 0) {
      print("go to refeiçoes page");
      Get.toNamed(Routes.REFEICOES);
    }
    if (currentIndex.value == 1) {
      Get.toNamed(Routes.ALIMENTOS);
      print("go to alimentos page");
    }
    if (currentIndex.value == 2) {
      Get.toNamed(Routes.INFORMACOES);
      print("go to informacoes page");
    }
    if (currentIndex.value == 3) {
      Get.toNamed(Routes.METAS);
      print("go to metas page");
    } */
  }
}
