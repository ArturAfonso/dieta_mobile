import 'package:get/get.dart';

import '../controllers/metas_controller.dart';

class MetasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MetasController>(
      () => MetasController(),
    );
  }
}
