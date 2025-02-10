import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_unit_controller.dart';

class SelectUnitView extends GetView<SelectUnitController> {
  const SelectUnitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Obx(() => controller.searchBarPressed.value
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: (() {
                  controller.searchBarPressed.value = false;
                  controller.searchUnitEditingController.clear();
                  //metodo para listar unidades
                }),
              )
            : IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: (() {
                  Get.back();
                }),
              )),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        title: SizedBox(
          width: Get.size.width,
          child: Obx(() => controller.searchBarPressed.value
              ? TextFormField(
                  onChanged: (query) {
                    //metodo para filtrar unidades
                  },
                  autofocus: true,
                  controller: controller.searchUnitEditingController,
                  cursorColor: Theme.of(context).colorScheme.onSurface,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffix: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Unidades',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
        ),
        /* Text(
          'Unidades',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ), */
        centerTitle: true,
        elevation: 0,
        actions: [
          Obx(() => Visibility(
                visible: !controller.searchBarPressed.value,
                child: TextButton(
                    onPressed: (() {
                      controller.searchBarPressed.value = true;
                    }),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
              ))
        ],
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
          child: ListView.separated(
            itemCount: controller.cLocalDatabase.unidades.length,
            itemBuilder: (context, index) {
              final unidade = controller.cLocalDatabase.unidades[index];
              return ListTile(
                title: Text(unidade.nome!),
                subtitle: Text(unidade.sigla!),
                onTap: () {
                  controller.cAlimentos.cadUnidadeAlimento.text = unidade.sigla!;
                  controller.update();
                  Get.back();
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        onPressed: () {
          // Get.toNamed(Routes.CADASTRARALIMENTOS);
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
