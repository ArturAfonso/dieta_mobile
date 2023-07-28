import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/refeicoes_controller.dart';

class RefeicoesView extends GetView<RefeicoesController> {
  const RefeicoesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Refeições'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: controller.listRefeicoes.length,
        itemBuilder: (_, index) {
          final GlobalKey globalKey = GlobalKey();
          return ListTile(
            title: Text(controller.listRefeicoes[index].calorias.toString()),
          );
        },
      ),
    );
  }
}
