// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dieta_mobile/app/data/shared/custom_button.dart';
import 'package:dieta_mobile/app/data/shared/widgets/custom_text_field.dart';
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
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,

        title: Text(
          'Editar Refeição',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
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
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
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
          padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0, bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomTextField(txtController: controller.nomeRefeicao),
                const SizedBox(height: 30),
                Text(
                  'Descrição',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  txtController: controller.descricaoRefeicao,
                  maxLines: 5,
                ),
                const SizedBox(height: 30),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Data',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hora',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(flex: 1, child: CustomTextField(txtController: controller.nomeRefeicao)),
                    const SizedBox(width: 15),
                    Expanded(flex: 1, child: CustomTextField(txtController: controller.nomeRefeicao)),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Está dentro da dieta?',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.isInDiet.value
                                    ? Theme.of(context).colorScheme.secondaryContainer
                                    : Theme.of(context).colorScheme.onInverseSurface,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: controller.isInDiet.value
                                        ? Theme.of(context).colorScheme.secondary
                                        : Theme.of(context).colorScheme.onInverseSurface,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                              ),
                              onPressed: () {
                                controller.isInDiet.value = !controller.isInDiet.value;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Theme.of(context).colorScheme.secondary,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Sim",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Obx(() => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: !controller.isInDiet.value
                                    ? Theme.of(context).colorScheme.primaryContainer
                                    : Theme.of(context).colorScheme.onInverseSurface,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: !controller.isInDiet.value
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).colorScheme.onInverseSurface,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                              ),
                              onPressed: () {
                                controller.isInDiet.value = !controller.isInDiet.value;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Theme.of(context).colorScheme.primary,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Não",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: CustomButton(
                    text: 'Cadastrar refeição',
                    onPressed: () {
                      //  controller.saveRefeicao();
                    },
                  ),
                ),
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



/**
 * 
 * Scaffold(
      appBar: AppBar(
        // leading: ,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,

        title: Text(
          'Editar Refeição',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
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
 */