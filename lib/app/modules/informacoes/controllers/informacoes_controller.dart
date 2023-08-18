import 'package:dieta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:dieta_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:dieta_mobile/app/modules/informacoes/controllers/saveinfo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class InformacoesController extends GetxController {
  HomeController cHome = Get.find();
  AuthController cAuth = Get.find();
  SaveInfoUserController cSaveUser = Get.find();
/*   final infoUserFormKey = GlobalKey<FormState>(); */
  final ScrollController scrollinformacoesAitController = ScrollController();
  GroupButtonController sexControllerButton = GroupButtonController();

  final TextEditingController controllerPeso = TextEditingController();
  final TextEditingController controllerAltura = TextEditingController();
  final TextEditingController controllerIdade = TextEditingController();

  final TextEditingController controllerGDA = TextEditingController();
  String generoUser = "H";
  //F.A
  RxString selectedFA = "Sedentário".obs;

  @override
  void onInit() {
    //TODO pegar o sexo das configuraçoes de usuario
    sexControllerButton.selectIndex(0);

    super.onInit();
  }

  preencheCamposInfo() {
    if (cAuth.userLogado != null) {
      controllerPeso.text = cAuth.userLogado?.peso.toString() ?? "";
      controllerAltura.text = cAuth.userLogado?.altura.toString() ?? "";
      controllerIdade.text = cAuth.userLogado?.idade.toString() ?? "";
      selectedFA.value = cAuth.userLogado?.fa.toString() ?? "";
      generoUser = cAuth.userLogado?.genero.toString() ?? "F";
      sexControllerButton.selectIndex(generoUser == "H" ? 0 : 1);
    }
  }
}
