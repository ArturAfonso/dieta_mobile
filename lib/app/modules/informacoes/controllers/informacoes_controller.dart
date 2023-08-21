import 'package:dieta_mobile/app/data/shared/constants_methods.dart';
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
  RxString iconBody = "assets/images/em-forma-man.png".obs;

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
      iconBody.value =
          cAuth.userLogado!.genero == "H" ? "assets/images/em-forma-man.png" : "assets/images/em-forma-woman.png";
      controllerPeso.text = ConstantMethods.removeDecimalIfZero(cAuth.userLogado!.peso.toString()) ?? "";
      controllerAltura.text = ConstantMethods.removeDecimalIfZero(cAuth.userLogado!.altura.toString()) ?? "";
      controllerIdade.text = ConstantMethods.removeDecimalIfZero(cAuth.userLogado!.idade.toString()) ?? "";
      selectedFA.value = cAuth.userLogado?.fa.toString() ?? "";
      generoUser = cAuth.userLogado?.genero.toString() ?? "F";
      sexControllerButton.selectIndex(generoUser == "H" ? 0 : 1);
    }
  }
}
