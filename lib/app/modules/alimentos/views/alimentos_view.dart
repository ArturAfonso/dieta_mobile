import 'package:dieta_mobile/app/data/shared/app_utils.dart';
import 'package:dieta_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alimentos_controller.dart';

class AlimentosView extends GetView<AlimentosController> {
  const AlimentosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).textTheme.titleLarge!.color),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        title: Text(
          'Alimentos',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      body: Container(
        height: Get.size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: controller.listAlimentos.length,
            itemBuilder: (context, index) {
              final alimento = controller.listAlimentos[index];
              return ListTile(
                title: Text(alimento.descricao!),
                subtitle: Text(AppUtils.formatDouble(alimento.calorias!)),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        onPressed: () {
          Get.put(AlimentosController());
          Get.toNamed(Routes.CADASTRARALIMENTOS);
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
