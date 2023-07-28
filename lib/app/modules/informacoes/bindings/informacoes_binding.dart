import 'package:get/get.dart';

import '../controllers/informacoes_controller.dart';

class InformacoesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformacoesController>(
      () => InformacoesController(),
    );
  }
}
