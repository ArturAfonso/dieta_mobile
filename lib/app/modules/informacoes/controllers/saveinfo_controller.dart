import 'package:dieta_mobile/app/data/models/user_model.dart';
import 'package:dieta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:dieta_mobile/app/modules/informacoes/controllers/informacoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/shared/dieta_utils.dart';

class SaveInfoUserController extends GetxController {
  AuthController cAuth = Get.find();
  GetStorage storage = GetStorage('storage');
  //HomeController cHome = Get.find();
  //InformacoesController cInfo = Get.find();

  Future<bool> saveUserInfo({
    required GlobalKey<FormState> form,
  }) async {
    bool canChangePage = false;
    final FormState? formState = form.currentState;
    if (formState != null && formState.validate()) {
      InformacoesController cInfo = Get.find();
      double gda = DietaUtils.calcularGCD(intensidade: 'Sedentário', altura: 173, idade: 30, peso: 100, sexo: "H");
      double? peso = double.tryParse(cInfo.controllerPeso.text);

      storage.write(
          'userLogado',
          UserModel(
            altura: cInfo.controllerAltura.text,
            fa: cInfo.controllerFA.text,
            gda: gda,
            genero: cInfo.generoUser,
            idade: cInfo.controllerIdade.text,
            peso: peso,
          ));

      cAuth.preencherUser = false;
      cAuth.userLogado = UserModel(
        altura: cInfo.controllerAltura.text,
        fa: cInfo.controllerFA.text,
        gda: gda,
        genero: cInfo.generoUser,
        idade: cInfo.controllerIdade.text,
        peso: peso,
      );
      canChangePage = true;
      return canChangePage;
    } else {
      form.currentState!.validate();
      return canChangePage;
    }
  }
}
