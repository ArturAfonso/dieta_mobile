import 'package:dieta_mobile/app/data/shared/widgets/customfextformfield_ait.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/informacoes_controller.dart';

class InformacoesView extends GetView<InformacoesController> {
  const InformacoesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Informações do usuário',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(height: Get.size.height / 3, "assets/images/em-forma.png"),
              Row(
                children: [
                  const Text("Peso: "),
                  Expanded(
                    child: CustomTextFormFieldAit(
                      customTextFormController: controller.controllerPeso,
                      isObscure: false,
                      readOnly: false,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Text("Altura: "),
                  Expanded(
                      child: CustomTextFormFieldAit(
                    customTextFormController: controller.controllerAltura,
                    isObscure: false,
                    readOnly: false,
                  ))
                ],
              ),
              Row(
                children: [
                  const Text("Idade: "),
                  Expanded(
                      child: CustomTextFormFieldAit(
                    customTextFormController: controller.controllerIdade,
                    isObscure: false,
                    readOnly: false,
                  ))
                ],
              ),
              Row(
                children: [
                  const Text("FA(coeficiente): "),
                  Expanded(
                      child: CustomTextFormFieldAit(
                    customTextFormController: controller.controllerFA,
                    isObscure: false,
                    readOnly: false,
                  ))
                ],
              ),
              Row(
                children: [
                  const Text("G.D.A (gasto calórico diário): "),
                  Expanded(
                      child: CustomTextFormFieldAit(
                    customTextFormController: controller.controllerGDA,
                    isObscure: false,
                    readOnly: false,
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
