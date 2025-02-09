import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/shared/widgets/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/alimentos_controller.dart';

class CadastrarAlimentoView extends GetView<AlimentosController> {
  const CadastrarAlimentoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).textTheme.titleLarge!.color),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          'Cadastrar alimento',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Container(
        height: Get.size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.size.height,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        controller.showSelectImage(context);
                      },
                      child: Obx(
                        () => controller.base64Image.value != ''
                            ? Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: MemoryImage(
                                      controller.base64Decode(controller.base64Image.value),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                        child: IconButton(
                                          icon: const Icon(Icons.edit, color: Colors.white),
                                          onPressed: () {
                                            // Lógica para ação do botão de câmera
                                            controller.showSelectImage(context);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Get.theme.colorScheme.onPrimaryContainer,
                                ),
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Adicionar imagem',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                        child: IconButton(
                                          icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                                          onPressed: () {
                                            // Lógica para ação do botão de câmera
                                            controller.showSelectImage(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      )),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nome',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(txtController: controller.cadtituloAlimento),
                  const SizedBox(height: 10),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Proteínas',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Carboidratros',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CustomTextField(
                              keyBoarType: TextInputType.number, txtController: controller.cadProteinaAlimento)),
                      const SizedBox(width: 15),
                      Expanded(
                          flex: 1,
                          child: CustomTextField(
                              keyBoarType: TextInputType.number, txtController: controller.cadCarboidratoAlimento)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Gorduras',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Calorias',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CustomTextField(
                              keyBoarType: TextInputType.number, txtController: controller.cadGorduraAlimento)),
                      const SizedBox(width: 15),
                      Expanded(
                          flex: 1,
                          child: CustomTextField(
                              keyBoarType: TextInputType.number, txtController: controller.cadCaloriaAlimento)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Quantidade',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Unidade',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CustomTextField(
                              keyBoarType: TextInputType.number, txtController: controller.cadQuantidadeAlimento)),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Stack(children: [
                          CustomTextField(
                            readOnly: true,
                            keyBoarType: TextInputType.number,
                            txtController: controller.cadUnidadeAlimento,
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint('select unit');
                              Get.focusScope?.unfocus();
                              Get.toNamed(Routes.SELECT_UNIT);
                            },
                            child: Container(
                              width: Get.size.width,
                              height: 60,
                              color: Colors.transparent,
                            ),
                          ),
                          GetBuilder<AlimentosController>(
                            init: controller,
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                visible: controller.cadUnidadeAlimento.text != "" &&
                                    controller.cadUnidadeAlimento.text.isNotEmpty,
                                child: Positioned(
                                  right: 0,
                                  bottom: 5,
                                  child: IconButton(
                                      onPressed: () {
                                        print('remove');
                                        controller.cadUnidadeAlimento.clear();
                                        controller.update();
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: Theme.of(context).colorScheme.error,
                                      )),
                                ),
                              );
                            },
                          ),
                        ]),
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
