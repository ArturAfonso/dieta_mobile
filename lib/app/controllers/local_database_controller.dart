import 'package:dieta_mobile/app/data/models/unidade_model.dart';
import 'package:get/get.dart';

import '../data/models/alimento_model.dart';
import '../data/models/refeicao_model.dart';

class LocalDatabaseController extends GetxController {
  List<UnidadeModel> unidades = [
    UnidadeModel(nome: "Grama", sigla: "g"),
    UnidadeModel(nome: "Quilo", sigla: "KG"),
    UnidadeModel(nome: "Miligrama", sigla: "mg"),
    UnidadeModel(nome: "Litro", sigla: "L"),
    UnidadeModel(nome: "Mililitro", sigla: "ml"),
    UnidadeModel(nome: "Unidade", sigla: "Un"),
  ];

  RxList<RefeicaoModel> listRefeicoes = <RefeicaoModel>[].obs;
  RxList<AlimentoModel> listAlimentos = <AlimentoModel>[].obs;
}
