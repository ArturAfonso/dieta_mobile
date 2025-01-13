// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dieta_mobile/app/modules/refeicoes/widgets/alimento_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dieta_mobile/app/modules/refeicoes/controllers/refeicoes_controller.dart';

class RefeicaoEditpage extends GetView<RefeicoesController> {
  const RefeicaoEditpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Editar Refeição',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Obx(() => IconButton(
                icon:
                    Icon(controller.editRefPage.value == true ? Icons.save_outlined : Icons.edit, color: Colors.white),
                onPressed: () {
                  // Lógica para ação do botão de câmera
                  controller.enableEditPage();
                },
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.size.height,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                    base64Decode(controller.base64Image.value),
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
                Expanded(
                    child: MenuForm(
                  controller: controller,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuForm extends StatelessWidget {
  const MenuForm({super.key, required this.controller});
  final RefeicoesController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Título',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Obx(() => MyCustomTextField(
              hintText: 'Nome da Refeição',
              editable: controller.editRefPage.value,
            )),
        const SizedBox(height: 20),
        const Divider(
          color: Color(0xFFDADADA),
        ),
        const SizedBox(height: 20),
        const Text(
          'Itens da Refeição',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Flexible(
          child: GetBuilder<RefeicoesController>(
            init: controller,
            initState: (_) {},
            builder: (_) {
              return ListView.separated(
                itemCount: controller.listAlimentos.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.listAlimentos[index];
                  return Dismissible(
                    direction:
                        controller.editRefPage.value == true ? DismissDirection.horizontal : DismissDirection.none,
                    key: ObjectKey(controller.listAlimentos[index]),
                    onDismissed: (d) {
                      controller.listAlimentos.removeAt(index);
                      controller.update();
                      //Text(' dismissed')
                      controller.showSnackbar(context);
                    },
                    child: AlimentoTile(
                      index: index,
                      alimento: controller.listAlimentos[index],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 3,
                    thickness: 1,
                    color: Colors.grey[300],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class MyCustomTextField extends StatelessWidget {
  Icon? prefixIcon;
  Icon? sufixIcon;
  String? hintText;
  bool? editable;
  MyCustomTextField({
    Key? key,
    this.prefixIcon,
    this.sufixIcon,
    this.hintText,
    this.editable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: editable,
      style: const TextStyle(
        color: Colors.orange,
      ), // Cor do texto digitado (laranja)
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFDADADA).withOpacity(0.4), // Cor do fundo (cinza)
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
        prefixIcon: prefixIcon, // Ícone à esquerda
        suffixIcon: sufixIcon, // Ícone à direita

        hintText: hintText,
        hintStyle: TextStyle(color: Get.theme.colorScheme.secondary),
        prefixStyle: TextStyle(color: Colors.grey[600]), // Cor do texto fixo (cinza escuro)
      ),
    );
  }
}
