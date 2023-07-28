import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/informacoes_controller.dart';

class InformacoesView extends GetView<InformacoesController> {
  const InformacoesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Informações'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InformacoesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
