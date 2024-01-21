import 'dart:convert';

import 'package:dieta_mobile/app/modules/refeicoes/controllers/refeicoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ),
      body: SizedBox(
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
            const Expanded(child: MenuForm()),
          ],
        ),
      ),
    );
  }
}

class MenuForm extends GetView<RefeicoesController> {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nome da refeição',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const MyCustomTextField(),
        const SizedBox(height: 20),
        const Text(
          'Itens da Refeição',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Flexible(
          child: ListView(
            children: const [
              ListTile(title: Text('Alimento 1')),
              ListTile(title: Text('Alimento 2')),
              ListTile(title: Text('Alimento 3')),
              ListTile(title: Text('Alimento 4')),
              ListTile(title: Text('Alimento 5')),
            ],
          ),
        ),
      ],
    );
  }
}

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.orange), // Cor do texto digitado (laranja)
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFDADADA), // Cor do fundo (cinza)
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: const Icon(Icons.person, color: Colors.orange), // Ícone à esquerda
        suffixIcon: const Icon(Icons.info, color: Colors.orange), // Ícone à direita
        prefixText: 'Texto Fixo ', // Texto fixo à esquerda
        prefixStyle: TextStyle(color: Colors.grey[600]), // Cor do texto fixo (cinza escuro)
      ),
    );
  }
}
