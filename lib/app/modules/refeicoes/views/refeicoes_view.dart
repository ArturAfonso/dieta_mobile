// ignore_for_file: unused_local_variable

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Refeições',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/icons/form.png",
              height: 50,
            )
          ],
        ),
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
