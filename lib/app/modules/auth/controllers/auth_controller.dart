// ignore_for_file: avoid_print

import 'package:dieta_mobile/app/data/models/user_model.dart';
import 'package:dieta_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage storage = GetStorage('storage');
  UserModel? userLogado;
  bool? preencherUser = false;

  @override
  void onInit() {
    loadUserLogado();
    super.onInit();
  }

  String loadUserLogado() {
    if (storage.read('userLogado') == null) {
      preencherUser = true;
      return AppPages.INITIAL;
    } else {
      var mapaUser = storage.read("userLogado");
      print(mapaUser.runtimeType.toString());
      if (mapaUser.runtimeType.toString() == '_Map<String, dynamic>') {
        userLogado = UserModel.fromJson(mapaUser);
        print(userLogado.runtimeType.toString());
      }
      preencherUser = false;
      return AppPages.INITIAL;
    }
  }
}
