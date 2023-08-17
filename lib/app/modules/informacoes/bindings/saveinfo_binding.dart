import 'package:dieta_mobile/app/modules/informacoes/controllers/saveinfo_controller.dart';
import 'package:get/get.dart';

class SaveInfoUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaveInfoUserController>(
      () => SaveInfoUserController(),
    );
  }
}
