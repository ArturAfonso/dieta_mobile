import 'package:get/get.dart';

import '../controllers/select_unit_controller.dart';

class SelectUnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectUnitController>(
      () => SelectUnitController(),
    );
  }
}
