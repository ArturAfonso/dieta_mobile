import 'package:get/get.dart';

import '../controllers/cadastrar_refeicao_controller.dart';

class CadastrarRefeicaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CadastrarRefeicaoController>(
      () => CadastrarRefeicaoController(),
    );
  }
}
