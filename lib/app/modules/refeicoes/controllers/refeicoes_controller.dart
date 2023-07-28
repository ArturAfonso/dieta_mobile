import 'package:dieta_mobile/app/data/models/refeicao_model.dart';
import 'package:get/get.dart';

class RefeicoesController extends GetxController {
  RxList<RefeicaoModel> listRefeicoes = <RefeicaoModel>[].obs;
  @override
  void onInit() {
    listRefeicoes.addAll([
      RefeicaoModel(calorias: 50),
      RefeicaoModel(calorias: 20),
      RefeicaoModel(calorias: 15),
      RefeicaoModel(calorias: 32)
    ]);
    super.onInit();
  }
}
