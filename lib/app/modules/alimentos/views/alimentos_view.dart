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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Alimentos',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/icons/cooking.png",
              height: 50,
            )
          ],
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
