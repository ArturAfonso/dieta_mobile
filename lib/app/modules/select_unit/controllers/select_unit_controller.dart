import 'package:dieta_mobile/app/data/models/unidade_model.dart';
import 'package:dieta_mobile/app/modules/alimentos/controllers/alimentos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUnitController extends GetxController {
  AlimentosController cAlimentos = Get.find();
  RxBool searchBarPressed = false.obs;
  TextEditingController searchUnitEditingController = TextEditingController();
  List<UnidadeModel> unidades = [
    UnidadeModel(nome: "Grama", sigla: "g"),
    UnidadeModel(nome: "Quilo", sigla: "KG"),
    UnidadeModel(nome: "Miligrama", sigla: "mg"),
    UnidadeModel(nome: "Litro", sigla: "L"),
    UnidadeModel(nome: "Mililitro", sigla: "ml"),
    UnidadeModel(nome: "Unidade", sigla: "Un"),
  ];
}
