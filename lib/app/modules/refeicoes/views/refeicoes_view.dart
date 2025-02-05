// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dieta_mobile/app/data/shared/app_utils.dart';
import 'package:dieta_mobile/app/data/shared/custom_button.dart';
import 'package:dieta_mobile/app/modules/refeicoes/widgets/alimento_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dieta_mobile/app/modules/refeicoes/controllers/refeicoes_controller.dart';

import '../../../data/models/refeicao_model.dart';
import '../../../routes/app_pages.dart';

class RefeicoesView extends GetView<RefeicoesController> {
  const RefeicoesView({super.key});

  @override
  Widget build(BuildContext context) {
    final RefeicaoModel refeicao = Get.arguments as RefeicaoModel;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).textTheme.titleLarge!.color),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        title: Text(
          'Refeição',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
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
                  refeicao.titulo ?? "Sem título",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  refeicao.descricao ?? "Sem descrição",
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                const SizedBox(height: 40),
                Text(
                  'Data e hora',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  AppUtils.alternativeFormattedDate(refeicao.data!),
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: refeicao.naDieta
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          refeicao.naDieta ? "Dentro da dieta" : "Fora da dieta",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              icon: const Icon(Icons.edit),
              text: 'Editar refeição',
              onPressed: () {
                Get.toNamed(Routes.REFEICAOEDIT, arguments: refeicao);
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              backgroundColor: Theme.of(context).colorScheme.surface,
              icon: Icon(
                Icons.delete_forever,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              text: 'Excluir refeição',
              textStyle: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        color: Colors.white, // Define a cor de fundo como branca
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 16),
                              Text(
                                'Deseja realmente excluir o registro da refeição?',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      backgroundColor: Theme.of(context).colorScheme.surface,
                                      text: 'Cancelar',
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).textTheme.titleLarge!.color,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomButton(
                                      text: 'Sim, excluir',
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
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
