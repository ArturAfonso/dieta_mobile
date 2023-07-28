import 'package:get/get.dart';

import '../controllers/alimentos_controller.dart';

class AlimentosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlimentosController>(
      () => AlimentosController(),
    );
  }
}
