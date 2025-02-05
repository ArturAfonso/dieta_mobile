import 'package:dieta_mobile/app/data/models/refeicao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastrarRefeicaoController extends GetxController {
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

  void validadeRefeicao(BuildContext context) {
    if (formKey.currentState!.validate()) {
      refeicao.update((val) {
        val!.titulo = tituloRefeicao.text;
        val.descricao = descricaoRefeicao.text;
        /*   val. = dataRefeicaoDateIme;
        val.horaRefeicao = horaRefeicaoDateTime;
        val.naDieta = isInDiet.value; */
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
        /*  Get.showSnackbar(const GetSnackBar(
        title: 'Refeicao vazia',
        message: 'adcone pelo menos um alimento na refeiçao antes de salvar',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      )); */
      }
      print('proteinas ${refeicao.value.totalProteinas()}');
      print('calorias ${refeicao.value.totalCalorias()}');
      print('gorduras ${refeicao.value.totalGorduras()}');
      print('carboidratos ${refeicao.value.totalCarboidratos()}');

      //print(refeicao.value.);
    }
  }
}
