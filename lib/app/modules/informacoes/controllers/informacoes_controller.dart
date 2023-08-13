import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacoesController extends GetxController {
  final ScrollController scrollNovoAitController = ScrollController();

  final TextEditingController controllerPeso = TextEditingController();
  final TextEditingController controllerAltura = TextEditingController();
  final TextEditingController controllerIdade = TextEditingController();
  final TextEditingController controllerFA = TextEditingController();
  final TextEditingController controllerGDA = TextEditingController();

  final count = 0.obs;

  void increment() => count.value++;
}
