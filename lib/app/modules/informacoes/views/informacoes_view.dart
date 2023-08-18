// ignore_for_file: avoid_print

import 'package:dieta_mobile/app/data/shared/constants_lists.dart';
import 'package:dieta_mobile/app/data/shared/constants_methods.dart';
import 'package:dieta_mobile/app/data/shared/widgets/customfextformfield_ait.dart';
import 'package:dieta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../controllers/informacoes_controller.dart';
import 'package:group_button/group_button.dart';

class InformacoesView extends GetView<InformacoesController> {
  const InformacoesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.preencheCamposInfo();
    return Form(
      key: controller.cHome.formKeys[controller.cHome.currentIndex.value],
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GroupButton<String>(
                    buttons: const ["H", "M"],
                    controller: controller.sexControllerButton,
                    onSelected: (String g, int number, bool bo) {
                      print(g);
                      controller.generoUser = g;
                      //controller.cHome.formKeys[controller.cHome.currentIndex.value].currentState!.validate();
                    },
                    options: GroupButtonOptions(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(flex: 3, child: Image.asset(height: Get.size.height / 3, "assets/images/em-forma.png")),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: Get.size.height / 3,
                          //color: Colors.grey.shade300,
                          child: Column(
                            children: [
                              Text(
                                "G.D.A\n(gasto calórico diário)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GetBuilder<AuthController>(
                                init: controller.cAuth,
                                initState: (_) {},
                                builder: (_) {
                                  return controller.cSaveUser.isSaving.value == true
                                      ? const CircularProgressIndicator()
                                      : Text(controller.cAuth.userLogado?.gda?.toString() ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Peso: "),
                      Expanded(
                        child: CustomTextFormFieldAit(
                          onChanged: (text) {
                            controller.cSaveUser.editingUserText(text);
                          },
                          customTextFormController: controller.controllerPeso,
                          inputType: TextInputType.number,
                          textStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                          controller: controller,
                          hasBorder: true,
                          isObscure: false,
                          /*  sufixicon: GestureDetector(
                            onTap: () {
                              //controller.openModalConsultaInfracao(context);
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.red,
                            ),
                          ), */
                          readOnly: false,
                          borderRadius: 30,
                          contentPadding: const EdgeInsets.symmetric(
                            //vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          height: 45,
                          label: null,
                          staticlabel: true,
                          validator: Validatorless.multiple([
                            Validatorless.required('O campo é obrigatório'),
                          ]),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Altura: "),
                      Expanded(
                        child: CustomTextFormFieldAit(
                          customTextFormController: controller.controllerAltura,
                          inputType: TextInputType.number,
                          textStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                          controller: controller,
                          hasBorder: true,
                          isObscure: false,
                          /*  sufixicon: GestureDetector(
                            onTap: () {
                              //controller.openModalConsultaInfracao(context);
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.red,
                            ),
                          ), */
                          readOnly: false,
                          borderRadius: 30,
                          contentPadding: const EdgeInsets.symmetric(
                            //vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          height: 45,
                          label: null,
                          staticlabel: true,
                          validator: Validatorless.multiple([
                            Validatorless.required('O campo é obrigatório'),
                          ]),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Idade: "),
                      Expanded(
                        child: CustomTextFormFieldAit(
                          customTextFormController: controller.controllerIdade,
                          inputType: TextInputType.number,
                          textStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                          controller: controller,
                          hasBorder: true,
                          isObscure: false,
                          /*  sufixicon: GestureDetector(
                            onTap: () {
                              //controller.openModalConsultaInfracao(context);
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.red,
                            ),
                          ), */
                          readOnly: false,
                          borderRadius: 30,
                          contentPadding: const EdgeInsets.symmetric(
                            //vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          height: 45,
                          label: null,
                          staticlabel: true,
                          validator: Validatorless.multiple([
                            Validatorless.required('O campo é obrigatório'),
                          ]),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text("FA(coeficiente): "),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 60,
                          //width: Get.size.width,
                          child: Obx(() => DropdownButtonFormField<String>(
                                hint: const Text("pouco ou nenhum exercício"),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                                  label: Text(
                                    ConstantMethods.getLabelFA(controller.selectedFA.value),
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                                  ), // Estilo da borda
                                ),
                                // isDense: false,
                                isExpanded: true,
                                iconEnabledColor: Theme.of(context).primaryColor,
                                focusColor: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                value: controller.selectedFA.value,
                                items: ConstantsLists.constlistFA.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newvalue) {
                                  controller.selectedFA.value = newvalue.toString();
                                  print(controller.selectedFA.value);
                                },
                                validator: (value) {
                                  if (value == null || value == '-') {
                                    return 'Selecione uma opção';
                                  }
                                  return null;
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
