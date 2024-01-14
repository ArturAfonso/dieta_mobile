import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alimentos_controller.dart';

class AlimentosView extends GetView<AlimentosController> {
  const AlimentosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Alimentos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AlimentosView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
