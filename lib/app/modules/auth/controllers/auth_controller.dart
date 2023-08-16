import 'package:dieta_mobile/app/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage storage = GetStorage('storage');
  UserModel? userLogado;

  @override
  void onInit() {
    loadUserLogado();
    super.onInit();
  }

  loadUserLogado() {
    if (storage.read('userLogado') == null) {
    } else {
      var mapaUser = storage.read("userLogado");
      print(mapaUser.runtimeType.toString());
    }
  }
}
