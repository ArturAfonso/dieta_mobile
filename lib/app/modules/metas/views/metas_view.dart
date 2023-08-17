import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/metas_controller.dart';

class MetasView extends GetView<MetasController> {
  const MetasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Metas'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.storage.erase();
          },
          child: const Text(
            'MetasView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
