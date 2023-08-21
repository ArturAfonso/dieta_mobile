import 'package:dieta_mobile/app/data/models/user_model.dart';
import 'package:dieta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:dieta_mobile/app/modules/informacoes/controllers/informacoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/shared/dieta_utils.dart';

class SaveInfoUserController extends GetxController {
  AuthController cAuth = Get.find();
// InformacoesController cInfo = Get.find();
  GetStorage storage = GetStorage('storage');
  GlobalKey<FormState> formChave = GlobalKey<FormState>();
  RxBool isSaving = false.obs;

  editingUserText(String text) {
    final FormState? formState = formChave.currentState;
    if (formState != null && formState.validate()) {
      saveUserInfo(form: formChave);
    }
  }

  Future<bool> saveUserInfo({
    required GlobalKey<FormState> form,
  }) async {
    bool canChangePage = false;
    final FormState? formState = form.currentState;
    if (formState != null && formState.validate()) {
      isSaving.value = true;
      InformacoesController cInfo = Get.find();
      double gda = DietaUtils.calcularGCD(
          intensidade: cInfo.selectedFA.value,
          altura: int.parse(cInfo.controllerAltura.text),
          idade: int.parse(cInfo.controllerIdade.text),
          peso: double.parse(cInfo.controllerPeso.text),
          sexo: cInfo.generoUser);
      double? peso = double.tryParse(cInfo.controllerPeso.text);

      storage.write(
          'userLogado',
          UserModel(
            altura: cInfo.controllerAltura.text,
            fa: cInfo.selectedFA.value,
            gda: gda,
            genero: cInfo.generoUser,
            idade: cInfo.controllerIdade.text,
            peso: peso,
          ));

      cAuth.preencherUser = false;
      cAuth.update();
      cAuth.userLogado = UserModel(
        altura: cInfo.controllerAltura.text,
        fa: cInfo.selectedFA.value,
        gda: gda,
        genero: cInfo.generoUser,
        idade: cInfo.controllerIdade.text,
        peso: peso,
      );
      isSaving.value = false;
      cAuth.update();
      canChangePage = true;
      return canChangePage;
    } else {
      form.currentState!.validate();
      return canChangePage;
    }
  }
}
