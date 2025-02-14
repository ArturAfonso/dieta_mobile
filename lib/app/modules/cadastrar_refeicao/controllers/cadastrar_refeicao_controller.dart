import 'dart:convert';

import 'package:dieta_mobile/app/controllers/local_database_controller.dart';
import 'package:dieta_mobile/app/data/models/refeicao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastrarRefeicaoController extends GetxController {
  LocalDatabaseController cLocalDatabase = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tituloRefeicao = TextEditingController();
  TextEditingController descricaoRefeicao = TextEditingController();
  TextEditingController dataRefeicaoTxT = TextEditingController();
  TextEditingController horaRefeicaoTxt = TextEditingController();
  DateTime? dataRefeicaoDateIme;
  DateTime? horaRefeicaoDateTime;

  RxBool isInDiet = false.obs;

  Rx<RefeicaoModel> refeicao = RefeicaoModel(
    alimentos: [],
    naDieta: false,
    titulo: '',
  ).obs;

  void validadeRefeicao(BuildContext context, LocalDatabaseController controller) {
    if (formKey.currentState!.validate()) {
      refeicao.update((val) {
        val!.titulo = tituloRefeicao.text;
        val.descricao = descricaoRefeicao.text;
        val.data = dataRefeicaoDateIme;
        val.hora = horaRefeicaoDateTime;
        val.naDieta = isInDiet.value;
      });

      if (refeicao.value.alimentos!.isEmpty) {
        Get.snackbar(
          'Refeição vazia',
          'Adcione pelo menos um alimento na refeição antes de salvar',
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          duration: const Duration(seconds: 5),
          borderColor: Theme.of(context).colorScheme.primary,
          borderWidth: 1,
        );
        return;
      }
      controller.listRefeicoes.add(refeicao.value);
      cLocalDatabase.update();
      controller.update();
      refeicao.value = RefeicaoModel(
        alimentos: [],
        naDieta: false,
        titulo: '',
      );

      Get.back();

      print(jsonEncode(refeicao.value));
      print('proteinas ${refeicao.value.totalProteinas()}');
      print('calorias ${refeicao.value.totalCalorias()}');
      print('gorduras ${refeicao.value.totalGorduras()}');
      print('carboidratos ${refeicao.value.totalCarboidratos()}');
      print('dia da semana ${refeicao.value.diaDaSemana}');
      print('data ${refeicao.value.data}');
      print('hora ${refeicao.value.hora}');

      //print(refeicao.value.);
    }
  }
}
