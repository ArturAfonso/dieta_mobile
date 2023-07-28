import 'package:get/get.dart';

import '../controllers/refeicoes_controller.dart';

class RefeicoesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RefeicoesController>(
      () => RefeicoesController(),
    );
  }
}
