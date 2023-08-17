// ignore_for_file: avoid_print

import 'package:dieta_mobile/app/data/models/alimento_model.dart';
import 'package:dieta_mobile/app/data/models/refeicao_model.dart';
import 'package:dieta_mobile/app/data/shared/dieta_utils.dart';
import 'package:dieta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:dieta_mobile/app/modules/informacoes/controllers/saveinfo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  AuthController cAuth = Get.find();

  SaveInfoUserController cSaveInfo = Get.find();
  GetStorage storage = GetStorage('storage');
  RxInt currentIndex = 0.obs;
  RxBool bottonNavIsloading = false.obs;
  PageController pageController = PageController(initialPage: 0);

  RefeicaoModel refeicao = RefeicaoModel(alimentos: [
    AlimentoModel(descricao: "pao", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4),
    AlimentoModel(descricao: "maça", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4),
    AlimentoModel(descricao: "queijo", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4)
  ]);

  List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
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

  void changePage({required int page}) async {
    print(currentIndex.value);
    if (currentIndex.value == 2) {
      var retorno = await cSaveInfo.saveUserInfo(form: formKeys[currentIndex.value]);
      if (retorno == true) {
        bottonNavIsloading.value = true;
        Future.delayed(const Duration(milliseconds: 100), (() {
          bottonNavIsloading.value = false;
        }));

        currentIndex.value = page;
        pageController.jumpToPage(page);
      }
    } else {
      bottonNavIsloading.value = true;
      Future.delayed(const Duration(milliseconds: 100), (() {
        bottonNavIsloading.value = false;
      }));

      currentIndex.value = page;
      pageController.jumpToPage(page);
    }
  }
}
