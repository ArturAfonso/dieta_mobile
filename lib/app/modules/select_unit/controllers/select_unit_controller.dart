import 'package:dieta_mobile/app/controllers/local_database_controller.dart';
import 'package:dieta_mobile/app/modules/alimentos/controllers/alimentos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUnitController extends GetxController {
  LocalDatabaseController cLocalDatabase = Get.find();
  AlimentosController cAlimentos = Get.find();

  RxBool searchBarPressed = false.obs;
  TextEditingController searchUnitEditingController = TextEditingController();
}
