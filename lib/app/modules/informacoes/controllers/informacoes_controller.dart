import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class InformacoesController extends GetxController {
  final infoUserFormKey = GlobalKey<FormState>();
  final ScrollController scrollinformacoesAitController = ScrollController();
  GroupButtonController sexControllerButton = GroupButtonController();

  final TextEditingController controllerPeso = TextEditingController();
  final TextEditingController controllerAltura = TextEditingController();
  final TextEditingController controllerIdade = TextEditingController();
  final TextEditingController controllerFA = TextEditingController();
  final TextEditingController controllerGDA = TextEditingController();
  //F.A
  RxString selectedFA = "Sedentário".obs;

  @override
  void onInit() {
    //TODO pegar o sexo das configuraçoes de usuario
    sexControllerButton.selectIndex(0);
    super.onInit();
  }

  Future<bool> saveUserInfo() async {
    bool canChangePage = false;
    final FormState? formState = infoUserFormKey.currentState;
    if (formState != null && formState.validate()) {
      canChangePage = true;
      return canChangePage;
    } else {
      infoUserFormKey.currentState!.validate();
      return canChangePage;
    }
  }
}
