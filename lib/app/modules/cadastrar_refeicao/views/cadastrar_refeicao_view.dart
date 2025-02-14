import 'package:dieta_mobile/app/controllers/local_database_controller.dart';
import 'package:dieta_mobile/app/data/shared/app_utils.dart';
import 'package:dieta_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

import '../../../data/shared/custom_button.dart';
import '../../../data/shared/widgets/custom_text_field.dart';
import '../controllers/cadastrar_refeicao_controller.dart';
import '../widgets/date_picker.dart';

class CadastrarRefeicaoView extends GetView<CadastrarRefeicaoController> {
  const CadastrarRefeicaoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalDatabaseController cDatabaseLocal = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,

        title: Text(
          'Nova Refeição',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      body: Form(
        key: controller.formKey,
        child: Container(
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
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    txtController: controller.tituloRefeicao,
                    validator: Validatorless.required('Campo obrigatório'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descrição',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  CustomTextField(
                    txtController: controller.descricaoRefeicao,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Data',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hora',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  DateRangePicker(
                    /*   startDate: DateTime.now(),
                    startHour: DateTime.now(), */
                    validator: Validatorless.required('Campo obrigatório'),
                    onDateChanged: (date) {
                      final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
                      controller.dataRefeicaoTxT.text = dateFormat.format(date!).toString();
                      controller.dataRefeicaoDateIme = date;
                    },
                    onHourChanged: (hora) {
                      final DateFormat hourFormat = DateFormat('HH:mm');
                      controller.horaRefeicaoTxt.text = hourFormat.format(hora!).toString();
                      controller.horaRefeicaoDateTime = hora;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Alimentos da refeição',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<CadastrarRefeicaoController>(
                        init: controller,
                        initState: (_) {},
                        builder: (_) {
                          return Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 200, // Defina uma altura fixa para o ListView.builder
                              child: Obx(() {
                                //  final itemCount = controller.refeicao.value.alimentos!.length;
                                if (controller.refeicao.value.alimentos!.isEmpty) {
                                  return Column(
                                    children: [
                                      AddALimentoButton(controller: controller),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AddALimentoButton(controller: controller),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: GetBuilder<CadastrarRefeicaoController>(
                                          init: controller,
                                          initState: (_) {},
                                          builder: (_) {
                                            return ListView.builder(
                                                itemCount: controller.refeicao.value.alimentos!.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  final alimento = controller.refeicao.value.alimentos![index];
                                                  return Dismissible(
                                                    key: UniqueKey(),
                                                    confirmDismiss: (DismissDirection direction) async {
                                                      FocusScope.of(context).unfocus();
                                                      return await showDialog(
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
                                                                      'Deseja realmente excluir o alimento da refeição?',
                                                                      textAlign: TextAlign.center,
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .titleLarge!
                                                                          .copyWith(fontWeight: FontWeight.bold),
                                                                    ),
                                                                    const SizedBox(height: 24),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        Expanded(
                                                                          child: CustomButton(
                                                                            backgroundColor:
                                                                                Theme.of(context).colorScheme.surface,
                                                                            text: 'Cancelar',
                                                                            onPressed: () =>
                                                                                Navigator.of(context).pop(false),
                                                                            textStyle: TextStyle(
                                                                              fontSize: 18,
                                                                              color: Theme.of(context)
                                                                                  .textTheme
                                                                                  .titleLarge!
                                                                                  .color,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(width: 16),
                                                                        Expanded(
                                                                          child: CustomButton(
                                                                            text: 'Sim, excluir',
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop(true);
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
                                                    onDismissed: (direction) {
                                                      controller.refeicao.value.alimentos!.removeAt(index);
                                                      controller.update();

                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(content: Text('${alimento!.descricao} removido')),
                                                      );
                                                    },
                                                    background: Container(color: Colors.red),
                                                    child: InkWell(
                                                      onTap: () {
                                                        //Get.toNamed(Routes.REFEICOES, arguments: refeicao);
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(bottom: 8.0),
                                                        child: Container(
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                            color: Colors.transparent,
                                                            borderRadius: BorderRadius.circular(8.0),
                                                            border: Border.all(
                                                              color: Theme.of(context)
                                                                  .colorScheme
                                                                  .outlineVariant
                                                                  .withAlpha(120),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                                child: Icon(
                                                                  Icons.fastfood,
                                                                  color: Theme.of(context).colorScheme.secondary,
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                color: Theme.of(context)
                                                                    .colorScheme
                                                                    .outlineVariant
                                                                    .withAlpha(120),
                                                                thickness: 2,
                                                                width: 20,
                                                                indent: 10,
                                                                endIndent: 10,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  controller.refeicao.value.alimentos != null
                                                                      ? controller
                                                                          .refeicao.value.alimentos![index]!.descricao!
                                                                      : '',
                                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }),
                            ),
                          );
                        },
                      ),

                      const SizedBox(width: 10), // Adiciona um espaçamento entre os widgets
                      GetBuilder<CadastrarRefeicaoController>(
                        init: controller,
                        initState: (_) {},
                        builder: (_) {
                          return Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Proteínas',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(AppUtils.formatDouble(controller.refeicao.value.totalProteinas())),
                                const SizedBox(height: 5),
                                Text(
                                  'Carboidratos',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(AppUtils.formatDouble(controller.refeicao.value.totalCarboidratos())),
                                const SizedBox(height: 5),
                                Text(
                                  'Gorduras',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(AppUtils.formatDouble(controller.refeicao.value.totalGorduras())),
                                const SizedBox(height: 5),
                                Text(
                                  'Calorias',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  AppUtils.formatDouble(controller.refeicao.value.totalCalorias()),
                                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Está dentro da dieta?',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
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
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: CustomButton(
                      text: 'Cadastrar refeição',
                      onPressed: () {
                        // controller.formKey.currentState!.validate();
                        print(controller.refeicao.value.alimentos!.length);

                        controller.validadeRefeicao(context, cDatabaseLocal);
                      },
                    ),
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

class AddALimentoButton extends StatelessWidget {
  const AddALimentoButton({
    super.key,
    required this.controller,
  });

  final CadastrarRefeicaoController controller;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 35,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      text: "Adicionar alimento",
      onPressed: () async {
        var result = await Get.toNamed(Routes.ALIMENTOS);
        if (result != null) {
          print(result);

          controller.refeicao.value.alimentos!.add(result);
        }
        controller.update();
      },
    );
  }
}
